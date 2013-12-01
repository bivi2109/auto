<?php


class VehicleMake extends \Phalcon\Mvc\Model
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
    public $brand_id;
     
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
		$this->hasMany("id", "Ads", "make_id", NULL);
		$this->belongsTo("brand_id", "VehicleBrands", "id", NULL);

    }

}
