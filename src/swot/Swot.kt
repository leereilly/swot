package swot

fun isAcademic(email: String): Boolean {
    val parts = domainParts(email)
    return !isBlacklisted(parts) && (isUnderTLD(parts) || findSchoolNames(parts).isNotEmpty())
}

fun findSchoolNames(emailOrDomain: String): List<String> {
    return findSchoolNames(domainParts(emailOrDomain))
}

fun isUnderTLD(parts: List<String>): Boolean {
    return checkSet(Resources.tlds, parts)
}

fun isBlacklisted(parts: List<String>): Boolean {
    return checkSet(Resources.blackList, parts)
}

private object Resources {
    val tlds = readList("/tlds.txt") ?: error("Cannot find /tlds.txt")
    val blackList = readList("/blacklist.txt") ?: error("Cannot find /blacklist.txt")

    fun readList(resource: String) : Set<String>? {
        return javaClass.getResourceAsStream(resource)?.reader()?.buffered()?.lineSequence()?.toHashSet()
    }
}

private fun findSchoolNames(parts: List<String>): List<String> {
    val resourcePath = StringBuilder("")
    for (part in parts) {
        resourcePath.append('/').append(part)
        val school = Resources.readList("${resourcePath}.txt")
        if (school != null) {
            return school.toList()
        }
    }

    return arrayListOf()
}

private fun domainParts(emailOrDomain: String): List<String> {
    return emailOrDomain.trim().toLowerCase().substringAfter('@').substringAfter("://").substringBefore(':').split('.').reversed()
}

internal fun checkSet(set: Set<String>, parts: List<String>): Boolean {
    val subj = StringBuilder()
    for (part in parts) {
        subj.insert(0, part)
        if (set.contains(subj.toString())) return true
        subj.insert(0 ,'.')
    }
    return false
}
