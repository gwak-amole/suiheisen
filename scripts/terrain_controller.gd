extends Node3D

@export var terrain_velocity = 10.0
@export var num_terrain_chunks = 4
@export_dir var terrain_chunk_path = "res://scenes/terrain chunks/"
var TerrainChunks: Array[PackedScene] = []
var terrain_belt: Array[Node3D] = []
var isFirst = true;


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_load_terrain_scenes(terrain_chunk_path)
	_init_blocks(num_terrain_chunks)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_progress_terrain(delta)
	
func _init_blocks(num_chunks: int):
	for i in num_chunks:
		var chunk;
		if isFirst:
			chunk = TerrainChunks[0].instantiate();
			isFirst = false;
		else:
			chunk = TerrainChunks[1].instantiate();
			isFirst = true;
		if i == 0:
			chunk.position.z = _get_chunk_length(chunk) / 2
		else:
			_append_to_far_edge(terrain_belt[i-1], chunk)
		add_child(chunk)
		terrain_belt.append(chunk)
	
func _progress_terrain(delta:float):
	for chunk in terrain_belt:
		chunk.position.z += terrain_velocity * delta
	
	if terrain_belt[0].position.z >= _get_chunk_length(terrain_belt[0]) / 2:
		var last_terrain = terrain_belt[-1]
		var first_terrain = terrain_belt.pop_front()
		var chunk;
		if isFirst:
			chunk = TerrainChunks[0].instantiate();
			isFirst = false;
		else:
			chunk = TerrainChunks[1].instantiate();
			isFirst = true;
		_append_to_far_edge(last_terrain, chunk)
		add_child(chunk)
		terrain_belt.append(chunk)
		first_terrain.queue_free()

func _append_to_far_edge(target_block: MeshInstance3D, appending_block: MeshInstance3D):
	var target_half = _get_chunk_length(target_block) / 2
	var app_half = _get_chunk_length(appending_block) / 2
	appending_block.position.z = target_block.position.z - target_half - app_half
func _load_terrain_scenes(terrain_dir_path):
	var dir = DirAccess.open(terrain_dir_path)
	for scene_path in dir.get_files():
		print("load terrain block scene" + terrain_dir_path + " " + scene_path)
		TerrainChunks.append(load(terrain_dir_path + "/" + scene_path))
		
	
func _get_chunk_length(chunk_node: Node3D):
	var mesh_instance: MeshInstance3D
	
	if chunk_node is MeshInstance3D:
		mesh_instance = chunk_node as MeshInstance3D
	else:
		var meshes := chunk_node.find_children(
			"*",
			"MeshInstance3D",
			true,
			false
		)
		
		if not meshes.is_empty():
			mesh_instance = meshes[0] as MeshInstance3D
			
		if mesh_instance == null:
			push_error("no mesh instance3d found" + chunk_node.name)
			return 10.0
		
		if mesh_instance.mesh == null:
			push_error("mesh instance3d has no mesh fuck" + mesh_instance.name)
			return 10.0
		
		return mesh_instance.mesh.get_aabb().size.z;
