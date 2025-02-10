# Guidelines for annotators

This document provides guidance on particular aspects of the legal-cgel annotation procedure. A list of more general resources on CGEL/CGELBank can be found at the end of the document.

## Metadata tags

- Provide lemma `:l` tags only when the lemma form and surface form differ (e.g., inflected verb forms and plural nouns).
   * Exception: omit for determinatives (`D`) and pronouns (`N_pro`), as these are closed classes.
- Provide part-of-speech `:xpos` tags for verbs (see https://www.ling.upenn.edu/courses/Fall_2003/ling001/penn_treebank_pos.html), modal verbs (`MD`), cardinal numbers (always `CD`), and list item markers (`LS`). 
- Provide punctuation tags following the CGELBank Annotation Manual (Section 6.2.4 in version 1.1). 

We also follow the annotation manual for marking typographical errors in sentences. (The following is from Section 6.2 in version 1.1):  

> Where there is a clear error, both the original form and the corrected form are included in
the tree: the original form with a :t value (for "token" or "terminal"), and the corrected
form with a `:correct` value. The lemma should reflect the correct version of the word,
and must be indicated explicitly if it differs from the `:correct` value.

## Making note of unresolvable ambiguities

A sentence may exhibit structural ambiguities that can't be resolved out of context. Consider, e.g.:

"Any alien whose permanent resident status is terminated under paragraph (1) may request a review of such determination in a proceeding to remove the alien."

... which has two plausible readings (each with a distinct CGELBank analysis):

```
1. may [ request [ a review of such determination ] [ in a proceeding to remove the alien ] ] 
2. may [ request [ a review [ of such determination ] [ in a proceeding to remove the alien ] ] ] 
```

On reading (1), *the request* takes place in a removal proceeding. On reading (2), *the review* takes place in a removal proceeding. In CGELBank, these readings correspond to two possible attachment sites of the modifier PP *in a proceeding to remove the alien*. Note that there seems to be a much less plausible (though nonetheless possible) reading (3), in which *the determination* takes place in a removal proceeding:

```
3. may [ request [ a review [ of such [ determination [ in a proceeding to remove the alien ] ] ] ] ]
```

Annotators can ignore (3)-like cases but should note when there are multiple plausible analyses. Best practices in cases of unresolvable ambiguity are as follows:

- The annotator's CGELBank tree should reflect one of the plausible analyses.
- In a `:note` tag on the tree, describe the ambiguity in enough detail that another reader could understand what is going on. **Make sure the string `[AMBIG]` appears somewhere in the tag.**
- If the annotator believes that not all plausible analyses are *equally* plausible, add this to the `:note` tag with a brief explanation. (In this case, the annotator's tree should ideally reflect what the annotator takes to be the *most* plausible analysis).

### Exception: structural ambiguities that don't reflect distinct readings

Even if a sentence is consistent with multiple possible syntactic analyses, the readings associated with those analyses may be highly similar to one another. Consider, e.g.:

```
1. shall [ [ be enforced in United States courts ] [ in accordance with this chapter ] ]
2. shall [ be [ enforced in United States courts ] [ in accordance with this chapter ] ]
3. shall [ be [ enforced [ in United States courts ] [ in accordance with this chapter ] ] ]
```

Does the PP *in accordance with this subchapter* modify the modal *shall* (1), the auxiliary *be* (2), or the verb *enforced* (3)? It's not clear that these three resolutions of the PP attachment ambiguity give rise to appreciably distinct readings. In cases like this, the default preference is for low right attachment (3), and there is no need to make note of the ambiguity. 

## Making note 

If a difficult analytical choice is justified in part by appealing to an authoritative CGEL resource (e.g., _CGEL_ itself or _SIEG_), please make a `:note` with a reference to the relevant portion of that resource. 

## Dealing with legal terms of art

Legal terms of art should be analyzed as constituents. Terms of art consisting of multiple tokens include: *adversary proceeding*, *due process rights*, *Attorney General*, *Comptroller General*, *adverse effects*

If an annotator's analysis depends on analyzing a sequence of tokens as a term of art, and that sequence doesn't appear in the above list, the annotator should flag this for the reviewer. If the reviewer and annotator agree on the analysis, then the sequence should be added to the list.

## General resources on CGEL/CGELBank

```
@misc{reynolds2024cgelbankannotationmanualv11,
    title={CGELBank Annotation Manual v1.1}, 
    author={Brett Reynolds and Nathan Schneider and Aryaman Arora},
    year={2024},
    eprint={2305.17347},
    archivePrefix={arXiv},
    primaryClass={cs.CL},
    url={https://arxiv.org/abs/2305.17347}, 
}
@book{sieg,
    title={A student's introduction to English grammar, 2nd edition},
    author={Huddleston, Rodney and Pullum, Geoffrey K and Reynolds, Brett},
    year={2021},
    publisher={Cambridge University Press}
}
@book{cgel, 
    title={The Cambridge Grammar of the English Language}, 
    year={2002}
    author={Huddleston, Rodney and Pullum, Geoffrey K.}, 
    publisher={Cambridge University Press}, 
}
```

