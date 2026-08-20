.class public Lcom/beyond/util/BCalendarBridge;
.super Ljava/lang/Object;
.source "BCalendarBridge.java"


# instance fields
.field tm:J


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 13
    .local v0, "c":Ljava/util/Calendar;
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/beyond/util/BCalendarBridge;->tm:J

    .line 14
    return-void
.end method


# virtual methods
.method public diffDay(Lcom/beyond/util/BCalendarBridge;)I
    .locals 7
    .param p1, "date"    # Lcom/beyond/util/BCalendarBridge;

    .prologue
    .line 48
    iget-wide v3, p1, Lcom/beyond/util/BCalendarBridge;->tm:J

    iget-wide v5, p0, Lcom/beyond/util/BCalendarBridge;->tm:J

    sub-long v0, v3, v5

    .line 50
    .local v0, "diff":J
    const-wide/32 v3, 0x5265c00

    div-long v3, v0, v3

    long-to-int v2, v3

    .line 51
    .local v2, "ret":I
    return v2
.end method

.method public getDate(I)Ljava/lang/String;
    .locals 8
    .param p1, "day"    # I

    .prologue
    .line 37
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 38
    .local v0, "c":Ljava/util/Calendar;
    mul-int/lit8 v6, p1, 0x18

    mul-int/lit8 v6, v6, 0x3c

    mul-int/lit8 v6, v6, 0x3c

    mul-int/lit16 v6, v6, 0x3e8

    int-to-long v2, v6

    .line 39
    .local v2, "dt":J
    iget-wide v6, p0, Lcom/beyond/util/BCalendarBridge;->tm:J

    add-long/2addr v6, v2

    invoke-virtual {v0, v6, v7}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 41
    const/4 v6, 0x1

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v5

    .line 42
    .local v5, "y":I
    const/4 v6, 0x2

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v6

    add-int/lit8 v4, v6, 0x1

    .line 43
    .local v4, "m":I
    const/4 v6, 0x5

    invoke-virtual {v0, v6}, Ljava/util/Calendar;->get(I)I

    move-result v1

    .line 44
    .local v1, "d":I
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public setDate(Ljava/lang/String;)Z
    .locals 13
    .param p1, "date"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x3

    const/4 v12, 0x1

    const/4 v4, 0x0

    .line 17
    new-instance v10, Lcom/beyond/util/SimpleTokenizer;

    const/16 v1, 0x2f

    invoke-direct {v10, p1, v1}, Lcom/beyond/util/SimpleTokenizer;-><init>(Ljava/lang/String;C)V

    .line 19
    .local v10, "st":Lcom/beyond/util/SimpleTokenizer;
    new-array v7, v2, [I

    .line 20
    .local v7, "d":[I
    const/4 v8, 0x0

    .line 22
    .local v8, "i":I
    :goto_0
    invoke-virtual {v10}, Lcom/beyond/util/SimpleTokenizer;->next()Ljava/lang/String;

    move-result-object v11

    .line 23
    .local v11, "strTmp":Ljava/lang/String;
    if-nez v11, :cond_0

    .line 29
    :goto_1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 31
    .local v0, "c":Ljava/util/Calendar;
    aget v1, v7, v4

    aget v2, v7, v12

    add-int/lit8 v2, v2, -0x1

    const/4 v3, 0x2

    aget v3, v7, v3

    move v5, v4

    move v6, v4

    invoke-virtual/range {v0 .. v6}, Ljava/util/Calendar;->set(IIIIII)V

    .line 32
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v1

    iput-wide v1, p0, Lcom/beyond/util/BCalendarBridge;->tm:J

    .line 33
    return v12

    .line 24
    .end local v0    # "c":Ljava/util/Calendar;
    :cond_0
    add-int/lit8 v9, v8, 0x1

    .end local v8    # "i":I
    .local v9, "i":I
    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    aput v1, v7, v8

    .line 25
    if-lt v9, v2, :cond_1

    move v8, v9

    .end local v9    # "i":I
    .restart local v8    # "i":I
    goto :goto_1

    .end local v8    # "i":I
    .restart local v9    # "i":I
    :cond_1
    move v8, v9

    .end local v9    # "i":I
    .restart local v8    # "i":I
    goto :goto_0
.end method
