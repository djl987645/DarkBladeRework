.class public Lcom/beyond/util/SimpleTokenizer;
.super Ljava/lang/Object;
.source "SimpleTokenizer.java"


# instance fields
.field private delim:C

.field private pos:I

.field private pushback:Ljava/lang/String;

.field private str:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/util/SimpleTokenizer;->pushback:Ljava/lang/String;

    .line 23
    iput-object p1, p0, Lcom/beyond/util/SimpleTokenizer;->str:Ljava/lang/String;

    .line 25
    iput v1, p0, Lcom/beyond/util/SimpleTokenizer;->pos:I

    .line 26
    iput-char v1, p0, Lcom/beyond/util/SimpleTokenizer;->delim:C

    .line 27
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;C)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;
    .param p2, "delim"    # C

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/util/SimpleTokenizer;->pushback:Ljava/lang/String;

    .line 30
    iput-object p1, p0, Lcom/beyond/util/SimpleTokenizer;->str:Ljava/lang/String;

    .line 31
    iput-char p2, p0, Lcom/beyond/util/SimpleTokenizer;->delim:C

    .line 32
    const/4 v0, 0x0

    iput v0, p0, Lcom/beyond/util/SimpleTokenizer;->pos:I

    .line 33
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .prologue
    .line 38
    invoke-virtual {p0}, Lcom/beyond/util/SimpleTokenizer;->next()Ljava/lang/String;

    move-result-object v0

    .line 39
    .local v0, "temp":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/beyond/util/SimpleTokenizer;->pushback(Ljava/lang/String;)V

    .line 40
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public next()Ljava/lang/String;
    .locals 6

    .prologue
    const/4 v4, 0x0

    .line 46
    iget-object v5, p0, Lcom/beyond/util/SimpleTokenizer;->pushback:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 47
    iget-object v3, p0, Lcom/beyond/util/SimpleTokenizer;->pushback:Ljava/lang/String;

    .line 48
    .local v3, "result":Ljava/lang/String;
    iput-object v4, p0, Lcom/beyond/util/SimpleTokenizer;->pushback:Ljava/lang/String;

    .line 70
    .end local v3    # "result":Ljava/lang/String;
    :goto_0
    return-object v3

    .line 51
    :cond_0
    iget-object v5, p0, Lcom/beyond/util/SimpleTokenizer;->str:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v2

    .line 53
    .local v2, "len":I
    iget v5, p0, Lcom/beyond/util/SimpleTokenizer;->pos:I

    if-lt v5, v2, :cond_1

    move-object v3, v4

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    iget v1, p0, Lcom/beyond/util/SimpleTokenizer;->pos:I

    .line 56
    .local v1, "i":I
    :goto_1
    if-lt v1, v2, :cond_3

    .line 67
    :cond_2
    iget v4, p0, Lcom/beyond/util/SimpleTokenizer;->pos:I

    if-ne v1, v4, :cond_5

    const-string v3, ""

    .line 68
    .restart local v3    # "result":Ljava/lang/String;
    :goto_2
    add-int/lit8 v4, v1, 0x1

    iput v4, p0, Lcom/beyond/util/SimpleTokenizer;->pos:I

    goto :goto_0

    .line 57
    .end local v3    # "result":Ljava/lang/String;
    :cond_3
    iget-object v4, p0, Lcom/beyond/util/SimpleTokenizer;->str:Ljava/lang/String;

    invoke-virtual {v4, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 59
    .local v0, "ch":C
    iget-char v4, p0, Lcom/beyond/util/SimpleTokenizer;->delim:C

    if-eq v0, v4, :cond_2

    .line 62
    iget-char v4, p0, Lcom/beyond/util/SimpleTokenizer;->delim:C

    if-nez v4, :cond_4

    .line 63
    const/16 v4, 0xa

    if-eq v0, v4, :cond_2

    const/16 v4, 0x9

    if-eq v0, v4, :cond_2

    const/16 v4, 0x20

    if-eq v0, v4, :cond_2

    .line 56
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 67
    .end local v0    # "ch":C
    :cond_5
    iget-object v4, p0, Lcom/beyond/util/SimpleTokenizer;->str:Ljava/lang/String;

    iget v5, p0, Lcom/beyond/util/SimpleTokenizer;->pos:I

    invoke-virtual {v4, v5, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    goto :goto_2
.end method

.method public pushback(Ljava/lang/String;)V
    .locals 3
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/beyond/util/SimpleTokenizer;->pushback:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 75
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "pushback err: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/beyond/util/SimpleTokenizer;->pushback:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " <= "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 76
    :cond_0
    iput-object p1, p0, Lcom/beyond/util/SimpleTokenizer;->pushback:Ljava/lang/String;

    .line 77
    return-void
.end method
