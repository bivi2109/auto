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
     
}
