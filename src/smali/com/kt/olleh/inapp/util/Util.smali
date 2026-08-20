.class public Lcom/kt/olleh/inapp/util/Util;
.super Ljava/lang/Object;
.source "Util.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static addString(Ljava/lang/StringBuffer;Ljava/lang/String;F)V
    .locals 1
    .param p0, "str"    # Ljava/lang/StringBuffer;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "value"    # F

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 32
    const-string v0, ":"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 33
    invoke-virtual {p0, p2}, Ljava/lang/StringBuffer;->append(F)Ljava/lang/StringBuffer;

    .line 34
    const-string v0, "\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 35
    return-void
.end method

.method public static addString(Ljava/lang/StringBuffer;Ljava/lang/String;I)V
    .locals 1
    .param p0, "str"    # Ljava/lang/StringBuffer;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 15
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 16
    const-string v0, ":"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 17
    invoke-virtual {p0, p2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 18
    const-string v0, "\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 19
    return-void
.end method

.method public static addString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "str"    # Ljava/lang/StringBuffer;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 7
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 8
    const-string v0, ":"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 9
    invoke-virtual {p0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 10
    const-string v0, "\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 11
    return-void
.end method

.method public static addString(Ljava/lang/StringBuffer;Ljava/lang/String;Z)V
    .locals 1
    .param p0, "str"    # Ljava/lang/StringBuffer;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "value"    # Z

    .prologue
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 24
    const-string v0, ":"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 25
    invoke-virtual {p0, p2}, Ljava/lang/StringBuffer;->append(Z)Ljava/lang/StringBuffer;

    .line 26
    const-string v0, "\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 27
    return-void
.end method

.method public static addUrlString(Ljava/lang/StringBuffer;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1
    .param p0, "str"    # Ljava/lang/StringBuffer;
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "next"    # Z

    .prologue
    .line 39
    invoke-virtual {p0, p1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 40
    const-string v0, "="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 41
    invoke-virtual {p0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 42
    if-eqz p3, :cond_0

    .line 43
    const-string v0, "&"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 44
    :cond_0
    return-void
.end method
