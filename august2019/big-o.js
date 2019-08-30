// Given a string S and a set of words D, find the longest word in D that is a subsequence of S.

// Word W is a subsequence of S if some number of characters, possibly zero, can be deleted from S to form W, without reordering the remaining characters.

// Note: D can appear in any format (list, hash table, prefix tree, etc.

function findLongestSubsequence(word, subSet) {
    subSet.sort((a, b) => a.length < b.length);

    for (let i = 0; i < subSet.length; i++) {
        let indexes = [];
        let isCharInWord = true;
        let isSubsequence = true;


        for (let char of subSet[i]) {
            if (!word.includes(char)) {
                isCharInWord = false;
                break;
            };

            indexes.push(word.indexOf(char));
        }

        if (!isCharInWord) continue;

        for (let i = indexes.length - 1; i >= 1; i--) {
            if (indexes[i] < indexes[i - 1]) {
                isSubsequence = false;
                break;
            };
        }

        if (isSubsequence) return subSet[i];

    };
}

const longestSubsequence = findLongestSubsequence("abppplee", ["able", "ale", "apple", "bale", "appleb", "kangaroo"]);
console.log('Longest Subsequence: ', longestSubsequence);