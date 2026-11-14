---
title: '{{ replace .File.ContentBaseName "-" " " | title }}'
date: {{ .Date }}
draft: true
source: ""
as performed by: ""
added by: ""
tags: ""
---

{{ "{{< verse >}}" }}
First verse line
Second verse line
{{ "{{< /verse >}}" }}
{{ "{{< chorus >}}" }}
Chorus line
Chorus line
{{ "{{< /chorus >}}" }}