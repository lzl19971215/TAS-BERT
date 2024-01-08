CUDA_VISIBLE_DEVICES=0 python TAS_BERT_joint.py \
--data_dir data/semeval2016/three_joint/BIO/ \
--output_dir results/semeval2016/three_joint/BIO/tas \
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
--num_train_epochs 30


CUDA_VISIBLE_DEVICES=0 python TAS_BERT_joint.py \
--data_dir data/semeval2015/three_joint/BIO/ \
--output_dir results/semeval2015/three_joint/BIO/tas \
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
--num_train_epochs 30