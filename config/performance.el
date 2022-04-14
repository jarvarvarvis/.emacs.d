;;; performance.el -- Configuration of performance related settings -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;; Tweak GC and process IO settings
(setq gc-cons-threshold (* 100 1024 1024)
	read-process-output-max (* 1024 1024))

(provide 'performance)
;;; performance.el ends here
