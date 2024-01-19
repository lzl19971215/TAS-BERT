cd data
for n_aspect in 8 16 32
do
    python data_preprocessing_for_TAS.py --dataset laptop --output_folder aspect_${n_aspect}_train --n_aspect_per_sentence ${n_aspect}
done