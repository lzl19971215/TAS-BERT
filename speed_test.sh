# cd data

for n_aspect in 4 8 16 32 64 121
do
    # python data_preprocessing_for_TAS.py --dataset laptop --output_folder aspect_${n_aspect} --n_aspect_per_sentence ${n_aspect} --sample_test
    CUDA_VISIBLE_DEVICES=0 python PBERT_speed_test.py \
                            --data_dir data/laptop/three_joint/BIO/aspect_${n_aspect} \
                            --output_dir results/speed_test/pbert_aspect_${n_aspect} \
                            --vocab_file uncased_L-12_H-768_A-12/vocab.txt \
                            --bert_config_file uncased_L-12_H-768_A-12/bert_config.json \
                            --init_checkpoint uncased_L-12_H-768_A-12/pytorch_model.bin \
                            --tokenize_method word_split \
                            --use_crf \
                            --eval_test \
                            --test_freq 1 \
                            --do_lower_case \
                            --max_seq_length 128 \
                            --train_batch_size 48 \
                            --eval_batch_size 128 \
                            --learning_rate 2e-5 \
                            --num_train_epochs 1
done