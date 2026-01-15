# 小妖怪头
SHAPE_ID="003fe719725150960b14cdd6644afe5533743ef63d3767c495ab76a6384a9b2f"
# 女人上半身
SHAPE_ID="017c6e8b81a17c298baf2aba24fd62fa5a992ba8346bc86b2b5008caf1478873"
# 长发男人头
SHAPE_ID="0228c5cdba8393cd4d947ac2e915f769f684c73b87e6939c129611ba665cafcb"

DATA_FOLDER="${HOME}/chLi/Dataset/pixel_align/${SHAPE_ID}"

cd ./tools/preprocess/
python convert_cameras.py --source_dir ${DATA_FOLDER}/colmap
python preprocess_cameras.py --source_dir ${DATA_FOLDER}/colmap
cd ../..

CUDA_VISIBLE_DEVICES=2 \
  python run.py \
  --config configs/custom_e2e/coarse.py \
  -p ${DATA_FOLDER}/voxurf \
  --no_reload \
  --run_dvgo_init \
  --sdf_mode voxurf_coarse \
  --scene ${DATA_FOLDER}/colmap

CUDA_VISIBLE_DEVICES=2 \
  python run.py \
  --config configs/custom_e2e/fine.py \
  --render_test \
  -p ${DATA_FOLDER}/voxurf \
  --no_reload \
  --sdf_mode voxurf_fine \
  --scene ${DATA_FOLDER}/colmap

CUDA_VISIBLE_DEVICES=2 \
  python run.py \
  --config configs/custom_e2e/fine.py \
  -p ${DATA_FOLDER}/voxurf \
  --sdf_mode voxurf_fine \
  --scene ${DATA_FOLDER}/colmap \
  --render_only \
  --mesh_from_sdf
