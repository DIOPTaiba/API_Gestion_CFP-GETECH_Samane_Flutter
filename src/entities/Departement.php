<?php
use Doctrine\ORM\Annotation as ORM;
use Doctrine\Common\Collections\ArrayCollection;
/**
 * @Entity 
 * @Table(name="departement")
 **/
class Departement
{
    /** @Id @Column(type="integer") @GeneratedValue **/
    private $id;
    /** @Column(type="string") **/
    private $nom;
    /**
     * One departement non salarie has One Responsable.
     * @OneToOne(targetEntity="Responsable")
     * @JoinColumn(name="id_responsable", referencedColumnName="id")
     */
    private $id_responsable;
     /**
     * One Departement has many formations. This is the inverse side.
     * @OneToMany(targetEntity="Formation", mappedBy="departement")
     */
    private $formation;
    /**
     * Many Departement have one Admin. This is the owning side.
     * @ManyToOne(targetEntity="Admin", inversedBy="departement")
     * @JoinColumn(name="id_admin", referencedColumnName="id")
     */
    private $admin;
    
    public function __construct()
    {
        $this->formation = new ArrayCollection();
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
    public function getIdResponsable()
    {
        return $this->id_responsable;
    }

    /**
     * @param mixed $id_responsable
     */
    public function setIdResponsable($id_responsable)
    {
        $this->id_responsable = $id_responsable;
    }

    /**
     * @return mixed
     */
    public function getFormation()
    {
        return $this->formation;
    }

    /**
     * @param mixed $formation
     */
    public function setFormation($formation)
    {
        $this->formation = $formation;
    }

    /**
     * @return mixed
     */
    public function getAdmin()
    {
        return $this->admin;
    }

    /**
     * @param mixed $admin
     */
    public function setAdmin($admin)
    {
        $this->admin = $admin;
    }

}

?>