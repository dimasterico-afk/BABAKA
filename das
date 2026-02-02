using UnityEngine;

public class DASHER : MonoBehaviour
{
    public PLAYER_MAIN _main => GetComponentInParent<PLAYER_MAIN>();//заменить на индивидуальный

    public RaycastHit2D _hit_up;
    public RaycastHit2D _hit_center;
    public RaycastHit2D _hit_down;

    public string _ray_name_hit_up;
    public string _ray_name_hit_center;
    public string _ray_name_hit_down;

    private void Update()
    {
        if (Time.timeScale == 0) { return; }

        _hit_up = Physics2D.Raycast(transform.position + new Vector3(_main._dash_offset.x * _main._vector, _main._dash_offset.y) + new Vector3(0f,_main._dash_height, 0f),new Vector3(_main._dash_direction.x * _main._vector, _main._dash_direction.y, _main._dash_direction.z).normalized, _main._dash_distance, _main._dash_layer_mask);
        _hit_center = Physics2D.Raycast(transform.position + new Vector3(_main._dash_offset.x * _main._vector, _main._dash_offset.y), new Vector3(_main._dash_direction.x * _main._vector, _main._dash_direction.y, _main._dash_direction.z).normalized, _main._dash_distance, _main._dash_layer_mask);
        _hit_down = Physics2D.Raycast(transform.position + new Vector3(_main._dash_offset.x * _main._vector, _main._dash_offset.y) + new Vector3(0f, -_main._dash_height, 0f), new Vector3(_main._dash_direction.x * _main._vector, _main._dash_direction.y, _main._dash_direction.z).normalized, _main._dash_distance, _main._dash_layer_mask);

        _ray_name_hit_up = _hit_up.collider != null ? _hit_up.transform.name : null;
        _ray_name_hit_center = _hit_center.collider != null ? _hit_center.transform.name : null;
        _ray_name_hit_down = _hit_down.collider != null ? _hit_down.transform.name : null;

        _main._dash_can_right = (_ray_name_hit_up != null | _ray_name_hit_center != null | _ray_name_hit_down != null) & _main._vector > 0 ? false : true;
        _main._dash_can_left = (_ray_name_hit_up != null | _ray_name_hit_center != null | _ray_name_hit_down != null) & _main._vector < 0 ? false : true;

    }
}
