.class public Lorg/kwis/msf/io/Message;
.super Ljava/lang/Object;
.source "Message.java"


# instance fields
.field private addr:Ljava/lang/String;

.field private classification:B

.field private data:[B

.field private date:Ljava/util/Date;

.field private index:B

.field private intAddr:I

.field private len:I

.field private off:I

.field private teleServiceID:I


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 2
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "data"    # [B

    .prologue
    .line 23
    const/4 v0, 0x0

    array-length v1, p2

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/kwis/msf/io/Message;-><init>(Ljava/lang/String;[BII)V

    .line 24
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[BII)V
    .locals 2
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "data"    # [B
    .param p3, "off"    # I
    .param p4, "len"    # I

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/kwis/msf/io/Message;->date:Ljava/util/Date;

    .line 27
    if-eqz p2, :cond_1

    .line 28
    add-int v0, p4, p3

    array-length v1, p2

    if-gt v0, v1, :cond_0

    .line 29
    if-ltz p4, :cond_0

    if-ltz p3, :cond_0

    array-length v0, p2

    if-lt p3, v0, :cond_1

    .line 31
    :cond_0
    array-length v0, p2

    if-lez v0, :cond_1

    .line 32
    array-length v0, p2

    const/4 v1, 0x0

    aput-byte v1, p2, v0

    .line 36
    :cond_1
    iput-object p1, p0, Lorg/kwis/msf/io/Message;->addr:Ljava/lang/String;

    .line 37
    iput-object p2, p0, Lorg/kwis/msf/io/Message;->data:[B

    .line 38
    iput p3, p0, Lorg/kwis/msf/io/Message;->off:I

    .line 39
    iput p4, p0, Lorg/kwis/msf/io/Message;->len:I

    .line 40
    const/4 v0, -0x1

    iput v0, p0, Lorg/kwis/msf/io/Message;->intAddr:I

    .line 43
    return-void
.end method

.method public constructor <init>([B)V
    .locals 3
    .param p1, "data"    # [B

    .prologue
    .line 18
    const/4 v0, 0x0

    const/4 v1, 0x0

    array-length v2, p1

    invoke-direct {p0, v0, p1, v1, v2}, Lorg/kwis/msf/io/Message;-><init>(Ljava/lang/String;[BII)V

    .line 19
    return-void
.end method


# virtual methods
.method public getAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lorg/kwis/msf/io/Message;->addr:Ljava/lang/String;

    return-object v0
.end method

.method public getAddressInt()I
    .locals 1

    .prologue
    .line 114
    iget v0, p0, Lorg/kwis/msf/io/Message;->intAddr:I

    return v0
.end method

.method public getClassification()B
    .locals 1

    .prologue
    .line 62
    iget-byte v0, p0, Lorg/kwis/msf/io/Message;->classification:B

    return v0
.end method

.method public getData()[B
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lorg/kwis/msf/io/Message;->data:[B

    return-object v0
.end method

.method public getDate()Ljava/util/Date;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lorg/kwis/msf/io/Message;->date:Ljava/util/Date;

    return-object v0
.end method

.method public getIndex()B
    .locals 1

    .prologue
    .line 46
    iget-byte v0, p0, Lorg/kwis/msf/io/Message;->index:B

    return v0
.end method

.method public getLength()I
    .locals 1

    .prologue
    .line 75
    iget v0, p0, Lorg/kwis/msf/io/Message;->len:I

    return v0
.end method

.method public getOffset()I
    .locals 1

    .prologue
    .line 89
    iget v0, p0, Lorg/kwis/msf/io/Message;->off:I

    return v0
.end method

.method public getTeleServiceID()I
    .locals 1

    .prologue
    .line 54
    iget v0, p0, Lorg/kwis/msf/io/Message;->teleServiceID:I

    return v0
.end method

.method public setAddress(Ljava/lang/String;)V
    .locals 1
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 109
    iput-object p1, p0, Lorg/kwis/msf/io/Message;->addr:Ljava/lang/String;

    .line 110
    const/4 v0, -0x1

    iput v0, p0, Lorg/kwis/msf/io/Message;->intAddr:I

    .line 111
    return-void
.end method

.method public setAddressInt(I)V
    .locals 0
    .param p1, "addr"    # I

    .prologue
    .line 118
    iput p1, p0, Lorg/kwis/msf/io/Message;->intAddr:I

    .line 119
    return-void
.end method

.method public setClassification(B)V
    .locals 0
    .param p1, "newClassification"    # B

    .prologue
    .line 66
    iput-byte p1, p0, Lorg/kwis/msf/io/Message;->classification:B

    .line 67
    return-void
.end method

.method public setDate(Ljava/util/Date;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Date;

    .prologue
    .line 126
    iput-object p1, p0, Lorg/kwis/msf/io/Message;->date:Ljava/util/Date;

    .line 127
    return-void
.end method

.method public setIndex(B)V
    .locals 0
    .param p1, "newIndex"    # B

    .prologue
    .line 50
    iput-byte p1, p0, Lorg/kwis/msf/io/Message;->index:B

    .line 51
    return-void
.end method

.method public setLength(I)I
    .locals 3
    .param p1, "val"    # I

    .prologue
    const/4 v0, -0x1

    .line 79
    if-gez p1, :cond_1

    .line 85
    :cond_0
    :goto_0
    return v0

    .line 81
    :cond_1
    iget v1, p0, Lorg/kwis/msf/io/Message;->off:I

    add-int/2addr v1, p1

    iget-object v2, p0, Lorg/kwis/msf/io/Message;->data:[B

    array-length v2, v2

    if-gt v1, v2, :cond_0

    .line 84
    iput p1, p0, Lorg/kwis/msf/io/Message;->len:I

    .line 85
    iget v0, p0, Lorg/kwis/msf/io/Message;->len:I

    goto :goto_0
.end method

.method public setOffset(I)I
    .locals 3
    .param p1, "val"    # I

    .prologue
    const/4 v0, -0x1

    .line 93
    if-ltz p1, :cond_0

    iget-object v1, p0, Lorg/kwis/msf/io/Message;->data:[B

    array-length v1, v1

    if-lt p1, v1, :cond_1

    .line 101
    :cond_0
    :goto_0
    return v0

    .line 96
    :cond_1
    iget v1, p0, Lorg/kwis/msf/io/Message;->len:I

    add-int/2addr v1, p1

    iget-object v2, p0, Lorg/kwis/msf/io/Message;->data:[B

    array-length v2, v2

    if-gt v1, v2, :cond_0

    .line 100
    iput p1, p0, Lorg/kwis/msf/io/Message;->off:I

    .line 101
    iget v0, p0, Lorg/kwis/msf/io/Message;->off:I

    goto :goto_0
.end method

.method public setTeleServiceID(I)V
    .locals 0
    .param p1, "newTeleServiceID"    # I

    .prologue
    .line 58
    iput p1, p0, Lorg/kwis/msf/io/Message;->teleServiceID:I

    .line 59
    return-void
.end method
