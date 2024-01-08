dataset=$1
folder=$2
python evaluation_for_TSD_ASD_TASD.py \
  --output_dir results/${dataset}/three_joint/BIO/${folder} \
  --num_epochs 30 \
  --tag_schema BIO