<?php


class Comments extends \Phalcon\Mvc\Model
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
    public $content;
     
    /**
     *
     * @var integer
     */
    public $ads_id;
     
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
     * @var integer
     */
    public $user_id;
     
    /**
     * Initialize method for model.
     */
    public function initialize()
    {
		$this->belongsTo("ads_id", "Ads", "id", NULL);
		$this->belongsTo("user_id", "Users", "id", NULL);

    }

}
