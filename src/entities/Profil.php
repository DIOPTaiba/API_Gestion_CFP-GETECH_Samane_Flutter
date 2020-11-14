<?php
use Doctrine\ORM\Annotation as ORM;
use Doctrine\Common\Collections\ArrayCollection;
/**
 * @Entity 
 * @Table(name="profil")
 **/
class Profil
{
    /** @Id @Column(type="integer") @GeneratedValue **/
    private $id;
    /** @Column(type="string") **/
    private $nom;

     /**
     * One profil has many candidats. This is the inverse side.
     * @OneToMany(targetEntity="Candidat", mappedBy="profil")
     */
    private $candidat;

    
    public function __construct()
    {
        $this->candidat = new ArrayCollection();
    }
    public function getId()
    {
        return $this->id;
    }
    public function setId($id)
    {
        $this->id = $id;
    }

    public function getNom()
    {
        return $this->nom;
    }
    public function setNom($nom)
    {
        $this->nom = $nom;
    }

    public function getLongitude()
    {
        return $this->longitude;
    }
    public function setDate($longitude)
    {
        $this->longitude = $longitude;
    }

    public function getLatitude()
    {
        return $this->latitude;
    }
    public function setLatitude($latitude)
    {
        $this->latitude = $latitude;
    }
    
    public function getFormations()
    {
        return $this->formations;
    }
    public function setFormations($formations)
    {
        $this->formations = $formations;
    }
    public function getUser()
    {
        return $this->user;
    }
    public function setUser($user)
    {
        $this->user = $user;
    }
}

?>