<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom" xmlns:opensearch="http://a9.com/-/spec/opensearch/1.1/" xmlns:relevance="http://a9.com/-/opensearch/extensions/relevance/1.0/">
  <generator version="${server.version}">Alfresco (${server.edition})</generator>
  <title>Alfresco Keyword Search: ${search.searchTerms}</title> 
  <updated>${xmldate(date)}</updated>
  <icon>${absurl(url.context)}/images/logo/AlfrescoLogo16.ico</icon>
  <author> 
    <name><#if person??>${person.properties.userName}<#else>unknown</#if></name>
  </author> 
  <id>urn:uuid:${search.id}</id>
  <opensearch:totalResults>${search.totalResults}</opensearch:totalResults>
  <opensearch:startIndex>${search.startIndex}</opensearch:startIndex>
  <opensearch:itemsPerPage>${search.itemsPerPage}</opensearch:itemsPerPage>
  <opensearch:Query role="request" searchTerms="${search.searchTerms}" startPage="${search.startPage}" count="${search.itemsPerPage}" language="${search.localeId}"/>
  <link rel="alternate" href="${absurl(url.service)}?q=${search.searchTerms?url}&amp;p=${search.startPage}&amp;c=${search.itemsPerPage}&amp;l=${search.localeId}&amp;guest=${guest?string("true","")}&amp;format=html" type="text/html"/>
  <link rel="self" href="${absurl(url.service)}?q=${search.searchTerms?url}&amp;p=${search.startPage}&amp;c=${search.itemsPerPage}&amp;l=${search.localeId}&amp;guest=${guest?string("true","")}&amp;format=atom" type="application/atom+xml"/>
<#if search.startPage &gt; 1>
  <link rel="first" href="${absurl(url.service)}?q=${search.searchTerms?url}&amp;p=1&amp;c=${search.itemsPerPage}&amp;l=${search.localeId}&amp;guest=${guest?string("true","")}&amp;format=atom" type="application/atom+xml"/>
  <link rel="previous" href="${absurl(url.service)}?q=${search.searchTerms?url}&amp;p=${search.startPage - 1}&amp;c=${search.itemsPerPage}&amp;l=${search.localeId}&amp;guest=${guest?string("true","")}&amp;format=atom" type="application/atom+xml"/>
</#if>
<#if search.startPage &lt; search.totalPages>
  <link rel="next" href="${absurl(url.service)}?q=${search.searchTerms?url}&amp;p=${search.startPage + 1}&amp;c=${search.itemsPerPage}&amp;l=${search.localeId}&amp;guest=${guest?string("true","")}&amp;format=atom" type="application/atom+xml"/> 
  <link rel="last" href="${absurl(url.service)}?q=${search.searchTerms?url}&amp;p=${search.totalPages}&amp;c=${search.itemsPerPage}&amp;l=${search.localeId}&amp;guest=${guest?string("true","")}&amp;format=atom" type="application/atom+xml"/>
</#if>
  <link rel="search" type="application/opensearchdescription+xml" href="${absurl(url.service)}/description.xml"/>
<#list search.results as row>
  <entry>
    <title>${row.name}</title>
    <link rel="alternate" href="${absurl(url.context)}${row.url}"/>
    <icon>${absurl(url.context)}${row.icon16}</icon>       <#comment>TODO: What's the standard for entry icons?</#comment>
    <id>urn:uuid:${row.id}</id>
    <updated>${xmldate(row.properties.modified)}</updated>
    <summary>${row.properties.description!""}</summary>
    <author> 
      <name>${row.properties.creator}</name>
    </author> 
    <relevance:score>${row.score}</relevance:score>
  </entry>
</#list>
</feed>