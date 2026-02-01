using UnityEngine;

public class swiming : MonoBehaviour
{
    [Header ("Main")]
    [SerializeField] private float _move_speed = 1f;

    [Header ("Collider main")]
    [SerializeField] private Color _collider_main_color = new Color(0f, 0f, 1f, 0.5f);
    [SerializeField] private Vector3 _collider_main_offset = new Vector3(0f, 0f, 0f);
    [SerializeField] private Vector3 _collider_main_size = new Vector3(1f, 1f, 1f);
    [SerializeField] private Color _collider_side_color = new Color(1,0,0,0.5f);

    [Header ("Colliders behaviour")]
    [SerializeField] private float _collider_left_size = 1f;
    [SerializeField] private float _collider_right_size = 1f;
    [SerializeField] private float _collider_up_size = 1f;
    [SerializeField] private float _collider_down_size = 1f;
    [SerializeField] private float _collider_front_size = 1f;
    [SerializeField] private float _collider_back_size = 1f;

    [HideInInspector] private Rigidbody _rigid_body => gameObject.GetComponent<Rigidbody>();
    


    public Vector3 _test;
     


    void Start()
    {
        
    }

    void Update()
    {
 


        _rigid_body.linearVelocity = new Vector3(_move_speed ,_rigid_body.linearVelocity.y, _rigid_body.linearVelocity.z);
    }





     private void OnDrawGizmos()
    {
        Gizmos.color = _collider_main_color;
        Gizmos.DrawCube(transform.position + _collider_main_offset, _collider_main_size);

        Gizmos.color = _collider_side_color;
        Gizmos.DrawCube(new Vector3(transform.position.x - _collider_left_size / 2 -  _collider_main_size.x / 2 + _collider_main_offset.x, transform.position.y + _collider_main_offset.y, transform.position.z + _collider_main_offset.z), new Vector3(_collider_left_size, _collider_main_size.y, _collider_main_size.z));
        Gizmos.DrawCube(new Vector3(transform.position.x + _collider_right_size / 2 +  _collider_main_size.x / 2 + _collider_main_offset.x, transform.position.y + _collider_main_offset.y, transform.position.z + _collider_main_offset.z), new Vector3(_collider_right_size, _collider_main_size.y, _collider_main_size.z));
        
        Gizmos.DrawCube(new Vector3(transform.position.x + _collider_main_offset.x, transform.position.y + _collider_up_size / 2 +  _collider_main_size.y / 2 + _collider_main_offset.y, transform.position.z + _collider_main_offset.z), new Vector3(_collider_main_size.x, _collider_up_size, _collider_main_size.z));
        Gizmos.DrawCube(new Vector3(transform.position.x + _collider_main_offset.x, transform.position.y - _collider_down_size / 2 -  _collider_main_size.y / 2 + _collider_main_offset.y, transform.position.z + _collider_main_offset.z), new Vector3(_collider_main_size.x, _collider_down_size, _collider_main_size.z));

        Gizmos.DrawCube(new Vector3(transform.position.x + _collider_main_offset.x, transform.position.y + _collider_main_offset.y, transform.position.z + _collider_back_size / 2 + _collider_main_size.z / 2 + _collider_main_offset.z), new Vector3(_collider_main_size.x, _collider_main_size.y, _collider_back_size));
        Gizmos.DrawCube(new Vector3(transform.position.x + _collider_main_offset.x, transform.position.y + _collider_main_offset.y, transform.position.z - _collider_front_size / 2 - _collider_main_size.z / 2 + _collider_main_offset.z), new Vector3(_collider_main_size.x, _collider_main_size.y, _collider_front_size));
        
       /*  Gizmos.color = _collider_side_color;
        Gizmos.DrawCube(new Vector3(transform.position.x + _collider_main_size.x, transform.position.y, transform.position.z), _collider_left_size);
 */
        /* Gizmos.color = _collider_left_color;
        Gizmos.DrawCube(transform.position + _collider_left_offset, _collider_left_size);

        Gizmos.color = _collider_left_color;
        Gizmos.DrawCube(transform.position + _collider_left_offset, _collider_left_size);

        Gizmos.color = _collider_left_color;
        Gizmos.DrawCube(transform.position + _collider_left_offset, _collider_left_size);

        Gizmos.color = _collider_left_color;
        Gizmos.DrawCube(transform.position + _collider_left_offset, _collider_left_size); */
    }
}
