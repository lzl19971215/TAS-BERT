idx2polarity = {
    '0': 'negative',
    '1': 'neutral',
    '2': 'positive'
}

def process_acos_to_tas_format(acos_fn, tas_fn):
    with open(f'./laptop/raw/{acos_fn}', encoding='utf-8') as fr, open(f'./laptop/{tas_fn}', 'w', encoding='utf-8') as fw:
        fw.write('\t'.join(['sentence_id', 'sentence', 'target', 'category', 'polarity', 'category_polarity', 'entailed', 'start', 'end']) + '\n')
        for idx, line in enumerate(fr):
            line = line.strip()
            items = line.split('\t')
            sentence = items[0]
            quotes = items[1:]
            prev_start_end = prev_category = prev_sentiment = None
            for quote in quotes:
                quote_items = quote.split(' ')
                if prev_start_end == quote_items[0] and prev_category == quote_items[1] and prev_sentiment == quote_items[2]:
                    continue
                else:
                    prev_start_end = quote_items[0]
                    prev_category = quote_items[1]
                    prev_sentiment = quote_items[2]
                start, end = quote_items[0].split(',')
                start = int(start)
                end = int(end)
                if start == end == -1:
                    start = end = 0
                    target = 'NULL'
                else:
                    start += 1
                    end += 1
                    target = ' '.join(sentence.split(' ')[start - 1: end - 1])
                category = quote_items[1].replace('#', ' ').lower()
                polarity = idx2polarity[quote_items[2]]
                category_polarity = category + ' ' + polarity
                entailed = 'yes'
                wl = '\t'.join(str(x) for x in [idx, sentence, target, category, polarity, category_polarity, entailed, start, end]) + '\n'
                fw.write(wl)


if __name__ == '__main__':
    acos_files = ['laptop_quad_train.tsv', 'laptop_quad_dev.tsv', 'laptop_quad_test.tsv']
    for fn in acos_files:
        out_fn = fn.replace('quad', 'tas')
        process_acos_to_tas_format(fn, out_fn)

