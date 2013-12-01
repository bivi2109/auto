<?php


class VehicleBrands extends \Phalcon\Mvc\Model
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
    public $title;
     
    /**
     * Initialize method for model.
     */
    public function initialize()
    {
		$this->hasMany("id", "Ads", "brand_id", NULL);
		$this->hasMany("id", "VehicleMake", "brand_id", NULL);

    }

}
