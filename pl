//удалить в input managr  в Fire3 альтернативный ввод mouse 2
//удалить в input managr  в Fire1 альтернативный ввод mouse 0
//Добавить в input managr Fire4 с вводом mouse 0

using Unity.VisualScripting;
using UnityEngine;

public class PLAYER_MAIN : MonoBehaviour
{
    [HideInInspector] public MOVEMENT _movement => GetComponent<MOVEMENT>();


    [Header("MAIN_UI")]
    [SerializeField] public MAIN_UI _main_ui;
    [SerializeField] public bool _pause = false;


    //MOVEMENT
    [Header("MOVEMENT")]
    [SerializeField] public float _move_corrector = 0f;
    [SerializeField] public float _speed_move = 7f;
    [SerializeField] public float _speed_crouch = 3f;
    [SerializeField] public float _speed_run = 15f;
    [SerializeField] public int _vector = 1;
    [SerializeField] public float _max_velocity_y = 30f;
    [SerializeField] public Vector3 _move_vector_offset = new Vector3(0f, -1f, 0f);
    [SerializeField] public Color _move_vector_color = Color.yellow;

    //JUMP
    [Header("JUMP")]
    [SerializeField] public float _jump_power = 10f;
    [SerializeField] public float _jump_time = 0.2f;
    [SerializeField] public float _gravity_scale = 4f;

    //BODY
    [Header("BODY")]
    [SerializeField] public Color _body_box_collider_color = new Color(0, 1, 0);
    [SerializeField] public Vector2 _body_box_collider_size = new Vector2(1.2f, 3.4f);
    [SerializeField] public float _body_box_collider_edge = 0.05f;
    [SerializeField] public Vector3 _body_box_collider_offset = new Vector3(0, 0, 0);
    [SerializeField] public float _body_friction = 0f;


    //GROUNDER
    [Header("GROUNDER")]
    [SerializeField] public bool _grounded = false;
    [SerializeField] public bool _animation_grounded = false;
    [SerializeField] public Color _grounder_color = new Color(0f, 0.4f, 1f, 0.7f);
    [SerializeField] public Vector3 _grounder_offset = Vector3.zero;
    [SerializeField] public float _grounder_width = 0.6f;
    [SerializeField] public float _grounder_distance = 1.9f;
    [SerializeField] public Vector3 _grounder_direction = new Vector3(0f, -1f, 0);
    [SerializeField] public LayerMask _grounder_layer_mask;
    [SerializeField] public Vector3 _grounder_rotation_offset = Vector3.zero;
    [SerializeField] public Color _ground_rotation_color = Color.magenta;
    [SerializeField] public float _ground_rotation_distance = 2f;
    [SerializeField] public float _ground_rotation_widht = 0.5f;
    [SerializeField] public float _ground_rotation = 0f;

    //FOOT
    [Header("FOOT")]
    [SerializeField] public Color _foot_box_collider_color = new Color(0.6f, 0.2f, 0);
    [SerializeField] public Vector2 _foot_box_collider_size = new Vector2(1.18f, 0.2f);
    [SerializeField] public float _foot_box_collider_edge = 0.05f;
    [SerializeField] public Vector3 _foot_box_collider_offset = new Vector3(0, -1.6f, 0);
    [SerializeField] public float _foot_friction = 0f;

    //DASH
    [Header("DASH")]
    [SerializeField] public float _speed_dash = 50f;
    [SerializeField] public float _dash_time = 0.2f;
    [SerializeField] public float _dash_cool_down_time = 0.4f;
    [SerializeField] public float _dash_train_time = 0.01f;
    [SerializeField] public float _dash_destroy_time = 0.15f;
    [SerializeField] public GameObject _dash_prefab;

    //DASHER
    [Header("DASHER")]
    [SerializeField] public bool _dash_can_left = false;
    [SerializeField] public bool _dash_can_right = false;
    //
    [SerializeField] public Color _dash_color = new Color(1f, 0f, 0f, 0.7f);
    [SerializeField] public Vector3 _dash_offset = new Vector3(0f, 0f, 0f);
    [SerializeField] public float _dash_height = 1.3f;
    [SerializeField] public float _dash_distance = 0.9f;
    [SerializeField] public Vector3 _dash_direction = new Vector3(1f, 0f, 0);
    [SerializeField] public LayerMask _dash_layer_mask;

    //STOMP
    [Header("STOMP")]
    [SerializeField] public GameObject _stomp_prefab;
    [SerializeField] public float _stomp_train_time = 0.01f;
    [SerializeField] public float _stomp_destroy_time = 0.15f;
    [SerializeField] public float _stomp_cool_down_time = 0.4f;
    [SerializeField] public float _stomp_time_anti_soft_lock = 1.2f;

    //SHADOW
    [Header("SHADOW")]
    [SerializeField] public float _shadow_divider = 10f;
    [SerializeField] public Vector2 _offset_shadow = new Vector2(0f, 0f);

    private void Start()
    {
        //MOVEMENT
        this.AddComponent<MOVEMENT>();

        //BODY
        this.AddComponent<BODY>();

        //GROUNDER
        this.AddComponent<GROUNDER>();

        //FOOT
        this.AddComponent<FOOT>();
        this.AddComponent<FOOT_STOP>();

        //DASHER
        this.AddComponent<DASHER>();
    }
    private void Update()
    {
        _pause = _main_ui._pause;
    }

    private void OnDrawGizmos()
    {
        //BODY BOX COLLIDER
        Gizmos.color = _body_box_collider_color;

        Gizmos.DrawLine(new Vector3(transform.position.x - _body_box_collider_size.x / 2f - _body_box_collider_edge, transform.position.y + _body_box_collider_size.y / 2f + _body_box_collider_edge, transform.position.z) + _body_box_collider_offset, new Vector3(transform.position.x - _body_box_collider_size.x / 2f - _body_box_collider_edge, transform.position.y - _body_box_collider_size.y / 2f - _body_box_collider_edge, transform.position.z) + _body_box_collider_offset);
        Gizmos.DrawLine(new Vector3(transform.position.x + _body_box_collider_size.x / 2f + _body_box_collider_edge, transform.position.y + _body_box_collider_size.y / 2f + _body_box_collider_edge, transform.position.z) + _body_box_collider_offset, new Vector3(transform.position.x + _body_box_collider_size.x / 2f + _body_box_collider_edge, transform.position.y - _body_box_collider_size.y / 2f - _body_box_collider_edge, transform.position.z) + _body_box_collider_offset);

        Gizmos.DrawLine(new Vector3(transform.position.x - _body_box_collider_size.x / 2f - _body_box_collider_edge, transform.position.y + _body_box_collider_size.y / 2f + _body_box_collider_edge, transform.position.z) + _body_box_collider_offset, new Vector3(transform.position.x + _body_box_collider_size.x / 2f + _body_box_collider_edge, transform.position.y + _body_box_collider_size.y / 2f + _body_box_collider_edge, transform.position.z) + _body_box_collider_offset);
        Gizmos.DrawLine(new Vector3(transform.position.x - _body_box_collider_size.x / 2f - _body_box_collider_edge, transform.position.y - _body_box_collider_size.y / 2f - _body_box_collider_edge, transform.position.z) + _body_box_collider_offset, new Vector3(transform.position.x + _body_box_collider_size.x / 2f + _body_box_collider_edge, transform.position.y - _body_box_collider_size.y / 2f - _body_box_collider_edge, transform.position.z) + _body_box_collider_offset);

        Gizmos.DrawLine(new Vector3(transform.position.x - _body_box_collider_size.x / 2f - _body_box_collider_edge, transform.position.y + _body_box_collider_size.y / 2f + _body_box_collider_edge, transform.position.z) + _body_box_collider_offset, new Vector3(transform.position.x + _body_box_collider_size.x / 2f + _body_box_collider_edge, transform.position.y - _body_box_collider_size.y / 2f - _body_box_collider_edge, transform.position.z) + _body_box_collider_offset);
        Gizmos.DrawLine(new Vector3(transform.position.x + _body_box_collider_size.x / 2f + _body_box_collider_edge, transform.position.y + _body_box_collider_size.y / 2f + _body_box_collider_edge, transform.position.z) + _body_box_collider_offset, new Vector3(transform.position.x - _body_box_collider_size.x / 2f - _body_box_collider_edge, transform.position.y - _body_box_collider_size.y / 2f - _body_box_collider_edge, transform.position.z) + _body_box_collider_offset);


        //GROUNDER
        Gizmos.color = _grounder_color;

        Gizmos.DrawRay(transform.position + _grounder_offset, _grounder_direction.normalized * _grounder_distance);
        Gizmos.DrawRay(transform.position + _grounder_offset + new Vector3(_grounder_width, 0f, 0f), _grounder_direction.normalized * _grounder_distance);
        Gizmos.DrawRay(transform.position + _grounder_offset + new Vector3(-_grounder_width, 0f, 0f), _grounder_direction.normalized * _grounder_distance);

        Gizmos.DrawSphere(transform.position + _grounder_offset + _grounder_direction.normalized * _grounder_distance, 0.05f);
        Gizmos.DrawSphere(transform.position + _grounder_offset, 0.05f);
        Gizmos.DrawSphere(transform.position + _grounder_offset + new Vector3(_grounder_width, 0f, 0f) + _grounder_direction.normalized * _grounder_distance, 0.05f);
        Gizmos.DrawSphere(transform.position + _grounder_offset + new Vector3(_grounder_width, 0f, 0f), 0.05f);
        Gizmos.DrawSphere(transform.position + _grounder_offset + new Vector3(-_grounder_width, 0f, 0f) + _grounder_direction.normalized * _grounder_distance, 0.05f);
        Gizmos.DrawSphere(transform.position + _grounder_offset + new Vector3(-_grounder_width, 0f, 0f), 0.05f);

        Gizmos.color = _ground_rotation_color;
        Gizmos.DrawRay(transform.position + _grounder_rotation_offset, _grounder_direction.normalized * _ground_rotation_distance);
        Gizmos.DrawRay(transform.position + _grounder_rotation_offset + new Vector3(_ground_rotation_widht, 0f, 0f), _grounder_direction.normalized * _ground_rotation_distance);
        Gizmos.DrawRay(transform.position + _grounder_rotation_offset  - new Vector3(_ground_rotation_widht, 0f, 0f), _grounder_direction.normalized * _ground_rotation_distance);
        Gizmos.DrawSphere(transform.position + _grounder_rotation_offset + _grounder_direction.normalized * _ground_rotation_distance, 0.05f);
        Gizmos.DrawSphere(transform.position + _grounder_rotation_offset + new Vector3(_ground_rotation_widht, 0f, 0f) + _grounder_direction.normalized * _ground_rotation_distance, 0.05f);
        Gizmos.DrawSphere(transform.position + _grounder_rotation_offset - new Vector3(_ground_rotation_widht, 0f, 0f) + _grounder_direction.normalized * _ground_rotation_distance, 0.05f);

        //FOOT BOX COLLIDER
        Gizmos.color = _foot_box_collider_color;

        Gizmos.DrawLine(new Vector3(transform.position.x - _foot_box_collider_size.x / 2f - _foot_box_collider_edge, transform.position.y + _foot_box_collider_size.y / 2f + _foot_box_collider_edge, transform.position.z) + _foot_box_collider_offset, new Vector3(transform.position.x - _foot_box_collider_size.x / 2f - _foot_box_collider_edge, transform.position.y - _foot_box_collider_size.y / 2f - _foot_box_collider_edge, transform.position.z) + _foot_box_collider_offset);
        Gizmos.DrawLine(new Vector3(transform.position.x + _foot_box_collider_size.x / 2f + _foot_box_collider_edge, transform.position.y + _foot_box_collider_size.y / 2f + _foot_box_collider_edge, transform.position.z) + _foot_box_collider_offset, new Vector3(transform.position.x + _foot_box_collider_size.x / 2f + _foot_box_collider_edge, transform.position.y - _foot_box_collider_size.y / 2f - _foot_box_collider_edge, transform.position.z) + _foot_box_collider_offset);

        Gizmos.DrawLine(new Vector3(transform.position.x - _foot_box_collider_size.x / 2f - _foot_box_collider_edge, transform.position.y + _foot_box_collider_size.y / 2f + _foot_box_collider_edge, transform.position.z) + _foot_box_collider_offset, new Vector3(transform.position.x + _foot_box_collider_size.x / 2f + _foot_box_collider_edge, transform.position.y + _foot_box_collider_size.y / 2f + _foot_box_collider_edge, transform.position.z) + _foot_box_collider_offset);
        Gizmos.DrawLine(new Vector3(transform.position.x - _foot_box_collider_size.x / 2f - _foot_box_collider_edge, transform.position.y - _foot_box_collider_size.y / 2f - _foot_box_collider_edge, transform.position.z) + _foot_box_collider_offset, new Vector3(transform.position.x + _foot_box_collider_size.x / 2f + _foot_box_collider_edge, transform.position.y - _foot_box_collider_size.y / 2f - _foot_box_collider_edge, transform.position.z) + _foot_box_collider_offset);

        Gizmos.DrawLine(new Vector3(transform.position.x - _foot_box_collider_size.x / 2f - _foot_box_collider_edge, transform.position.y + _foot_box_collider_size.y / 2f + _foot_box_collider_edge, transform.position.z) + _foot_box_collider_offset, new Vector3(transform.position.x + _foot_box_collider_size.x / 2f + _foot_box_collider_edge, transform.position.y - _foot_box_collider_size.y / 2f - _foot_box_collider_edge, transform.position.z) + _foot_box_collider_offset);
        Gizmos.DrawLine(new Vector3(transform.position.x + _foot_box_collider_size.x / 2f + _foot_box_collider_edge, transform.position.y + _foot_box_collider_size.y / 2f + _foot_box_collider_edge, transform.position.z) + _foot_box_collider_offset, new Vector3(transform.position.x - _foot_box_collider_size.x / 2f - _foot_box_collider_edge, transform.position.y - _foot_box_collider_size.y / 2f - _foot_box_collider_edge, transform.position.z) + _foot_box_collider_offset);


        //DASHER
        Gizmos.color = _dash_color;

        Gizmos.DrawRay(transform.position + new Vector3(_dash_offset.x * _vector, _dash_offset.y), new Vector3(_dash_direction.x * _vector, _dash_direction.y, _dash_direction.z).normalized * _dash_distance);
        Gizmos.DrawRay(transform.position + new Vector3(_dash_offset.x * _vector, _dash_offset.y) + new Vector3(0f, _dash_height, 0f), new Vector3(_dash_direction.x * _vector, _dash_direction.y, _dash_direction.z).normalized * _dash_distance);
        Gizmos.DrawRay(transform.position + new Vector3(_dash_offset.x * _vector, _dash_offset.y) + new Vector3(0f, -_dash_height, 0f), new Vector3(_dash_direction.x * _vector, _dash_direction.y, _dash_direction.z).normalized * _dash_distance);

        Gizmos.DrawSphere(transform.position + new Vector3(_dash_offset.x * _vector, _dash_offset.y) + new Vector3(_dash_direction.x * _vector, _dash_direction.y, _dash_direction.z).normalized * _dash_distance, 0.05f);
        Gizmos.DrawSphere(transform.position + new Vector3(_dash_offset.x * _vector, _dash_offset.y), 0.05f);
        Gizmos.DrawSphere(transform.position + new Vector3(_dash_offset.x * _vector, _dash_offset.y) + new Vector3(0f, _dash_height, 0f) + new Vector3(_dash_direction.x * _vector, _dash_direction.y, _dash_direction.z).normalized * _dash_distance, 0.05f);
        Gizmos.DrawSphere(transform.position + new Vector3(_dash_offset.x * _vector, _dash_offset.y) + new Vector3(0f, _dash_height, 0f), 0.05f);
        Gizmos.DrawSphere(transform.position + new Vector3(_dash_offset.x * _vector, _dash_offset.y) + new Vector3(0f, -_dash_height, 0f) + new Vector3(_dash_direction.x * _vector, _dash_direction.y, _dash_direction.z).normalized * _dash_distance, 0.05f);
        Gizmos.DrawSphere(transform.position + new Vector3(_dash_offset.x * _vector, _dash_offset.y) + new Vector3(0f, -_dash_height, 0f), 0.05f);
    }
}
