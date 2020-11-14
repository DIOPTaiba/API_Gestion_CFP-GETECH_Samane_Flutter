<?php
use Doctrine\ORM\Annotation as ORM;
use Doctrine\Common\Collections\ArrayCollection;
/**
 * @Entity 
 * @Table(name="administrateur")
 **/
class Admin
{
    /** @Id @Column(type="integer") @GeneratedValue **/
    private $id;
    /** @Column(type="string") **/
    private $nom;
    /** @Column(type="string") **/
    private $prenom;
    /** @Column(type="string") **/
    private $adresse;
    /** @Column(type="string") **/
    private $telephone;
    /** @Column(type="string") **/
    private $email;
    /** @Column(type="string") **/
    private $motPasse;
    
     /**
     * One Admin has many départemnts. This is the inverse side.
     * @OneToMany(targetEntity="Responsable", mappedBy="admin")
     */
    private $responsable;
    /**
     * One Admin has many départements. This is the inverse side.
     * @OneToMany(targetEntity="Departement", mappedBy="admin")
     */
    private $departement;

    public function __construct()
    {
        $this->responsable = new ArrayCollection();
        $this->departement = new ArrayCollection();
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

    public function getPrenom()
    {
        return $this->prenom;
    }

    public function setPrenom($prenom)
    {
        $this->prenom = $prenom;
    }

    public function getAdresse()
    {
        return $this->adresse;
    }


    public function setAdresse($adresse)
    {
        $this->adresse = $adresse;
    }

    public function getTelephone()
    {
        return $this->telephone;
    }


    public function setTelephone($telephone)
    {
        $this->telephone = $telephone;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function setEmail($email)
    {
        $this->email = $email;
    }

    public function getMotPasse()
    {
        return $this->motPasse;
    }

    public function setMotPasse($motPasse)
    {
        $this->motPasse = $motPasse;
    }

    public function getResponsable()
    {
        return $this->responsable;
    }

    public function setResponsable($responsable)
    {
        $this->responsable = $responsable;
    }

    public function getDepartement()
    {
        return $this->departement;
    }

    public function setDepartement($departement)
    {
        $this->departement = $departement;
    }



}

?>