#!/usr/bin/env clj
(def completions (keys (ns-publics (find-ns 'clojure.core))))
 
(with-open [f (java.io.BufferedWriter. (java.io.FileWriter. (str (System/getenv "HOME") "/.clj_completions")))]
    (.write f (apply str (interleave completions (repeat "\n")))))
