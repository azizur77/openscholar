<?php

class EventNodeRestfulBase extends OsNodeRestfulBase {

  public function publicFieldsInfo() {
    $public_fields = parent::publicFieldsInfo();

    $public_fields['start_date'] = array(
      'property' => 'field_date',
      'sub_property' => 'value',
      'process_callbacks' => array(
        array($this, 'dateProcess'),
      ),
    );

    $public_fields['end_date'] = array(
      'property' => 'field_date',
      'sub_property' => 'value2',
      'process_callbacks' => array(
        array($this, 'dateProcess'),
      ),
    );

    $public_fields['registration'] = array(
      'property' => 'registration',
      'sub_property' => 'registration_type',
    );

    $public_fields['field_event_registration'] = array(
      'property' => 'field_event_registration',
    );

    return $public_fields;
  }

  public function entityPreSave(\EntityMetadataWrapper $wrapper) {
    parent::entityPreSave($wrapper);
    $request = $this->getRequest();
    $date = $wrapper->field_date->value();
    $format = 'Y-m-d h:i:s';
    if (!empty($request['start_date'])) {
      $date[0]['value'] = date($format, $request['start_date']);
    }
    if (!empty($request['end_date'])) {
      $date[0]['value2'] = date($format, $request['end_date']);
    }
    $wrapper->field_date->set($date);
  }
}
