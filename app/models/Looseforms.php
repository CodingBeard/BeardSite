<?php

/**
 * Loose Forms
 * 
 * @category 
 * @package BeardSite
 * @author Tim Marshall <Tim@CodingBeard.com>
 * @copyright (c) 2015, Tim Marshall
 * @license New BSD License
 */

namespace models;

use CodingBeard\Blameable;
use Phalcon\Mvc\Model;

class Looseforms extends Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $name;

    /**
     *
     * @var integer
     */
    public $user_id;

    /**
     * 
     * @var integer
     */
    public $private;

    /**
     * Contains array of field [Keys] => full field names
     * @var array
     */
    public $fields = [];

    /**
     * Populate $this->fields with the fields this form has after fetching data
     */
    public function afterFetch()
    {
        foreach ($this->formfields as $field) {
            $this->fields[$field->fieldKey] = $field->fieldName;
        }
    }

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->keepSnapshots(true);
        $this->addBehavior(new Blameable());
        $this->useDynamicUpdate(true);
        $this->hasMany("id", "models\Formentrys", "form_id", ['alias' => 'Entries']);
        $this->hasMany("id", "models\Formfields", "form_id", ['alias' => 'Formfields']);
        $this->belongsTo("user_id", "models\Users", "id", ['alias' => 'Users']);
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return [
            'id' => 'id',
            'name' => 'name',
            'user_id' => 'user_id',
            'private' => 'private'
        ];
    }

}
