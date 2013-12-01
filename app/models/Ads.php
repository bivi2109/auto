<?php


class Ads extends \Phalcon\Mvc\Model
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
     * @var integer
     */
    public $make_id;
     
    /**
     *
     * @var string
     */
    public $description;
     
    /**
     *
     * @var integer
     */
    public $rating;
     
    /**
     *
     * @var string
     */
    public $created;
     
    /**
     *
     * @var string
     */
    public $updated;
     
    /**
     *
     * @var string
     */
    public $header;
     
    /**
     *
     * @var integer
     */
    public $price;
     
    /**
     *
     * @var integer
     */
    public $mileage;
     
    /**
     *
     * @var integer
     */
    public $city_id;
     
    /**
     *
     * @var integer
     */
    public $owner_id;
     
    /**
     *
     * @var integer
     */
    public $transmission_id;
     
    /**
     *
     * @var integer
     */
    public $body_style_id;
     
    /**
     *
     * @var integer
     */
    public $color_id;
     
    /**
     * Initialize method for model.
     */
    public function initialize()
    {
		$this->hasMany("id", "Comments", "ads_id", NULL);
		$this->belongsTo("brand_id", "VehicleBrands", "id", NULL);
		$this->belongsTo("make_id", "VehicleMake", "id", NULL);
		$this->belongsTo("owner_id", "Users", "id", NULL);
		$this->belongsTo("transmission_id", "VehicleTransmission", "id", NULL);
		$this->belongsTo("body_style_id", "BodyStyles", "id", NULL);
		$this->belongsTo("color_id", "Colors", "id", NULL);
		$this->belongsTo("city_id", "Cities", "id", NULL);

    }

}
