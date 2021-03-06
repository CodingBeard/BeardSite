<?php

/**
 * Permissionroles
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

class Permissionroles extends Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var integer
     */
    public $permission_id;

    /**
     *
     * @var integer
     */
    public $role_id;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->keepSnapshots(true);
        $this->addBehavior(new Blameable());
        $this->useDynamicUpdate(true);
        $this->belongsTo("role_id", "models\Roles", "id", ['alias' => 'Roles']);
        $this->belongsTo("permission_id", "models\Permissions", "id", ['alias' => 'Permissions']);
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return [
            'id' => 'id',
            'permission_id' => 'permission_id',
            'role_id' => 'role_id'
        ];
    }

}
