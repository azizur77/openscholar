<?php
/**
 * @author RoySegall
 * @category boxes
 *
 * Display content similar to the current node the user watching.
 */
class os_boxes_search_mlt extends os_boxes_default {

  /**
   * Implementation of boxes_content::options_defaults().
   */
  public function options_defaults() {
    $options = parent::options_defaults();
    $options['results_number'] = 5;
    $options['type'] = 'all';
    return $options;
  }

  /**
   * Implementation of boxes_content::options_form().
   */
  public function options_form(&$form_state) {
    $form = parent::options_form($form_state);
    $this->options = ($this->options) ? array_merge($this->options_defaults(), $this->options) : $this->options_defaults();

    $form['results_number'] = array(
      '#type' => 'textfield',
      '#title' => t('Results number'),
      '#description' => t('Define hoe much results should the block display.'),
      '#default_value' => $this->options['results_number'],
    );

    $form['type'] = array(
      '#type' => 'select',
      '#title' => t('Node types'),
      '#description' => t('Select which node types to display'),
      '#options' => $content_types = array('all' => t('All')) + os_get_bundles(array(1)),
      '#default_value' => $this->options['type'],
    );

    return $form;
  }

  /**
   * Implements boxes_content::render().
   */
  public function render() {
    if (module_exists('vsite') && !vsite_get_vsite()) {
      return;
    }
    $object = menu_get_object();

    if (empty($object->nid)) {
      drupal_set_message(t("You need to be in a node page in order to see 'More like this' nodes."), 'error');
      return;
    }

    // @see apachesolr_search_block_view().
    $delta = 'mlt-001';
    $block = apachesolr_search_mlt_block_load($delta);
    $env_id = (!empty($block['mlt_env_id'])) ? $block['mlt_env_id'] : '';

    try {
      $solr = apachesolr_get_solr($env_id);
      $context['search_type'] = 'apachesolr_search_mlt';
      $context['block_id'] = $delta;
      $docs = apachesolr_search_mlt_suggestions($block, apachesolr_document_id($object->nid), $solr, $context);

      if (empty($docs)) {
        return array();
      }

      $block['title'] = $this->description;
      $block['delta'] = $this->delta;
      $block['content'] = theme('apachesolr_search_mlt_recommendation_block', array('docs' => $docs));

      return $block;
    }
    catch (Exception $e) {
      watchdog('Apache Solr', nl2br(check_plain($e->getMessage())), NULL, WATCHDOG_ERROR);
    }
  }
}
