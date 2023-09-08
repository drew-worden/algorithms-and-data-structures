//Implementation of the Rabin Karp Algorithm in Rust
//by Drew Worden

const BASE: u64 = 256;
const MODULUS: u64 = 1_000_000_007;

fn hash_string(s: &str, len: usize) -> u64 {
    let mut hash = 0;
    let mut base_pow = 1;

    for i in (0..len).rev() {
        let char_value = s.chars().nth(i).unwrap() as u64;
        hash = (hash + (char_value * base_pow) % MODULUS) % MODULUS;
        if i > 0 {
            base_pow = (base_pow * BASE) % MODULUS;
        }
    }

    hash
}

fn rabin_karp_search(text: &str, pattern: &str) -> Vec<usize> {
    let text_len = text.len();
    let pattern_len = pattern.len();
    let pattern_hash = hash_string(pattern, pattern_len);

    let mut result_indices = Vec::new();
    let mut text_hash = hash_string(&text[0..pattern_len], pattern_len);

    for i in 0..=text_len - pattern_len {
        if text_hash == pattern_hash && &text[i..i + pattern_len] == pattern {
            result_indices.push(i);
        }

        if i < text_len - pattern_len {
            let char_to_remove = text.chars().nth(i).unwrap() as u64;
            let char_to_add = text.chars().nth(i + pattern_len).unwrap() as u64;

            text_hash = (text_hash + MODULUS - (char_to_remove * BASE.pow(pattern_len as u32 - 1) % MODULUS)) % MODULUS;
            text_hash = (text_hash * BASE + char_to_add) % MODULUS;
        }
    }

    result_indices
}

fn main() {
    let text = "ABABDABACDABABCABAB";
    let pattern = "ABABCABAB";

    let result_indices = rabin_karp_search(text, pattern);

    if result_indices.is_empty() {
        println!("Pattern not found in the text.");
    } else {
        println!("Pattern found at indices: {:?}", result_indices);
    }
}
