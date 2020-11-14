<?php

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\ORM\Annotation as ORM;

/**
 * @Entity @Table(name="formation")
 **/
class Formation
{
    /** @Id @Column(type="integer") @GeneratedValue **/
    private $id;
    /** @Column(type="string") **/
    private $nom;
    /** @Column(type="string") **/
    private $date;
    /** @Column(type="integer") **/
    private $duree;
    /**
     * Many formation have one Departemnt. This is the owning side.
     * @ManyToOne(targetEntity="Departement", inversedBy="formation")
     * @JoinColumn(name="id_departement", referencedColumnName="id")
     */
    private $departement;
    /**
     * One Formation has many programmes. This is the inverse side.
     * @OneToMany(targetEntity="Programme", mappedBy="formation")
     */
    private $programme;
    /**
     * One Formation has many candidats. This is the inverse side.
     * @OneToMany(targetEntity="Candidat", mappedBy="formation")
     */
    private $candidat;

    
    public function __construct()
    {
        $this->programme = new ArrayCollection();
        $this->candidat = new ArrayCollection();
    }

    /**
     * @return mixed
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * @param mixed $id
     */
    public function setId($id)
    {
        $this->id = $id;
    }

    /**
     * @return mixed
     */
    public function getNom()
    {
        return $this->nom;
    }

    /**
     * @param mixed $nom
     */
    public function setNom($nom)
    {
        $this->nom = $nom;
    }

    /**
     * @return mixed
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * @param mixed $date
     */
    public function setDate($date)
    {
        $this->date = $date;
    }

    /**
     * @return mixed
     */
    public function getDuree()
    {
        return $this->duree;
    }

    /**
     * @param mixed $duree
     */
    public function setDuree($duree)
    {
        $this->duree = $duree;
    }

    /**
     * @return mixed
     */
    public function getDepartement()
    {
        return $this->departement;
    }

    /**
     * @param mixed $departement
     */
    public function setDepartement($departement)
    {
        $this->departement = $departement;
    }

    /**
     * @return mixed
     */
    public function getProgramme()
    {
        return $this->programme;
    }

    /**
     * @param mixed $programme
     */
    public function setProgramme($programme)
    {
        $this->programme = $programme;
    }

    /**
     * @return mixed
     */
    public function getCandidat()
    {
        return $this->candidat;
    }

    /**
     * @param mixed $candidat
     */
    public function setCandidat($candidat)
    {
        $this->candidat = $candidat;
    }

}

?>