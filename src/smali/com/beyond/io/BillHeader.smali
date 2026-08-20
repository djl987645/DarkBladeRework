.class Lcom/beyond/io/BillHeader;
.super Ljava/lang/Object;
.source "BillHeader.java"


# static fields
.field static final APIVER:I = 0x2

.field static final APIVER_SIZE:I = 0xa

.field static final BESTPN:I = 0xa

.field static final BESTPN_SIZE:I = 0x5

.field static final BID:I = 0x9

.field static final BID_SIZE:I = 0x5

.field static final CHANNEL:I = 0x6

.field static final CHANNEL_SIZE:I = 0x2

.field static final CLASSID:I = 0x1

.field static final CLASSID_SIZE:I = 0xa

.field static final CONN_TIME:I = 0xd

.field static final CONN_TIME_SIZE:I = 0x4

.field static final DEBUG:Z = false

.field static final DEST_IP:I = 0xc

.field static final DEST_IP_SIZE:I = 0x4

.field static final DEST_PORT:I = 0xb

.field static final DEST_PORT_SIZE:I = 0x2

.field static final EXTVER:I = 0x3

.field static final EXTVER_SIZE:I = 0xa

.field static final FIELD_CNT:I = 0x10

.field static final MODELNAME:I = 0x4

.field static final MODELNAME_SIZE:I = 0xa

.field static final MSIN:I = 0x5

.field static final MSIN_SIZE:I = 0x10

.field static final NID:I = 0x8

.field static final NID_SIZE:I = 0x5

.field static final PACKETLEN:I = 0x0

.field static final PACKETLEN_SIZE:I = 0x4

.field private static PHONE:Z = false

.field static final QOS:I = 0xe

.field static final QOS_SIZE:I = 0x5

.field static final RESERVED:I = 0xf

.field static final RESERVED_SIZE:I = 0xb

.field static final SEND_HEADER_LENGTH:I = 0x6c

.field static final SID:I = 0x7

.field static final SID_SIZE:I = 0x5

.field static final sizes:[I


# instance fields
.field private apiVersion:Ljava/lang/String;

.field private bid:Ljava/lang/String;

.field private currentCh:Ljava/lang/String;

.field private extVersion:Ljava/lang/String;

.field m_fields:[[B

.field private mnc:Ljava/lang/String;

.field private model:Ljava/lang/String;

.field private msin:Ljava/lang/String;

.field private nid:Ljava/lang/String;

.field private sid:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 65
    const/16 v0, 0x10

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/beyond/io/BillHeader;->sizes:[I

    .line 21
    return-void

    .line 65
    :array_0
    .array-data 4
        0x4
        0xa
        0xa
        0xa
        0xa
        0x10
        0x2
        0x5
        0x5
        0x5
        0x5
        0x2
        0x4
        0x4
        0x5
        0xb
    .end array-data
.end method

.method constructor <init>(Z)V
    .locals 4
    .param p1, "phone"    # Z

    .prologue
    const/16 v3, 0x10

    const/4 v1, 0x0

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object v1, p0, Lcom/beyond/io/BillHeader;->apiVersion:Ljava/lang/String;

    .line 75
    iput-object v1, p0, Lcom/beyond/io/BillHeader;->extVersion:Ljava/lang/String;

    .line 76
    iput-object v1, p0, Lcom/beyond/io/BillHeader;->model:Ljava/lang/String;

    .line 77
    iput-object v1, p0, Lcom/beyond/io/BillHeader;->msin:Ljava/lang/String;

    .line 78
    iput-object v1, p0, Lcom/beyond/io/BillHeader;->mnc:Ljava/lang/String;

    .line 79
    iput-object v1, p0, Lcom/beyond/io/BillHeader;->currentCh:Ljava/lang/String;

    .line 80
    iput-object v1, p0, Lcom/beyond/io/BillHeader;->sid:Ljava/lang/String;

    .line 81
    iput-object v1, p0, Lcom/beyond/io/BillHeader;->nid:Ljava/lang/String;

    .line 82
    iput-object v1, p0, Lcom/beyond/io/BillHeader;->bid:Ljava/lang/String;

    .line 89
    sput-boolean p1, Lcom/beyond/io/BillHeader;->PHONE:Z

    .line 92
    new-array v1, v3, [[B

    iput-object v1, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    .line 94
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v3, :cond_0

    .line 97
    return-void

    .line 95
    :cond_0
    iget-object v1, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    sget-object v2, Lcom/beyond/io/BillHeader;->sizes:[I

    aget v2, v2, v0

    new-array v2, v2, [B

    aput-object v2, v1, v0

    .line 94
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private checkPhoneNumber()V
    .locals 5

    .prologue
    const/4 v4, 0x3

    .line 210
    iget-object v1, p0, Lcom/beyond/io/BillHeader;->msin:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 212
    iget-object v1, p0, Lcom/beyond/io/BillHeader;->msin:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    .local v0, "len":I
    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    .line 214
    iget-object v1, p0, Lcom/beyond/io/BillHeader;->msin:Ljava/lang/String;

    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 216
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "0"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/beyond/io/BillHeader;->msin:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/beyond/io/BillHeader;->msin:Ljava/lang/String;

    .line 231
    .end local v0    # "len":I
    :cond_0
    :goto_0
    return-void

    .line 220
    .restart local v0    # "len":I
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/beyond/io/BillHeader;->msin:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v2, "0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/beyond/io/BillHeader;->msin:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/beyond/io/BillHeader;->msin:Ljava/lang/String;

    goto :goto_0
.end method

.method public static debug(Ljava/lang/Object;Ljava/lang/String;)V
    .locals 4
    .param p0, "object"    # Ljava/lang/Object;
    .param p1, "sMessage"    # Ljava/lang/String;

    .prologue
    .line 354
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 355
    .local v0, "className":Ljava/lang/String;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "[BBILL] "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "  ::::: at "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 356
    return-void
.end method

.method private longToBytes(J)[B
    .locals 6
    .param p1, "value"    # J

    .prologue
    const-wide/16 v4, 0xff

    .line 335
    const/4 v1, 0x4

    new-array v0, v1, [B

    .line 336
    .local v0, "retValue":[B
    const/4 v1, 0x0

    and-long v2, p1, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 337
    const/4 v1, 0x1

    const/16 v2, 0x8

    shr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 338
    const/4 v1, 0x2

    const/16 v2, 0x10

    shr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 339
    const/4 v1, 0x3

    const/16 v2, 0x18

    shr-long v2, p1, v2

    and-long/2addr v2, v4

    long-to-int v2, v2

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 340
    return-object v0
.end method

.method private parseCellID(Ljava/lang/String;)Z
    .locals 11
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    const/4 v10, 0x5

    .line 294
    if-nez p1, :cond_0

    :try_start_0
    const-string p1, ""

    .line 296
    :cond_0
    const/4 v8, 0x5

    new-array v5, v8, [B

    .line 297
    .local v5, "upper_cellId":[B
    const/4 v8, 0x5

    new-array v1, v8, [B

    .line 299
    .local v1, "down_cellId":[B
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    .line 302
    .local v0, "cellId":[B
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    if-lt v3, v10, :cond_1

    .line 306
    const/4 v8, 0x0

    const/4 v9, 0x5

    aget-byte v9, v0, v9

    aput-byte v9, v1, v8

    .line 307
    const/4 v8, 0x1

    const/4 v9, 0x6

    aget-byte v9, v0, v9

    aput-byte v9, v1, v8

    .line 308
    const/4 v3, 0x2

    :goto_1
    if-lt v3, v10, :cond_2

    .line 311
    const/4 v3, 0x0

    :goto_2
    if-lt v3, v10, :cond_3

    move v6, v7

    .line 330
    .end local v0    # "cellId":[B
    .end local v1    # "down_cellId":[B
    .end local v3    # "i":I
    .end local v5    # "upper_cellId":[B
    :goto_3
    return v6

    .line 303
    .restart local v0    # "cellId":[B
    .restart local v1    # "down_cellId":[B
    .restart local v3    # "i":I
    .restart local v5    # "upper_cellId":[B
    :cond_1
    aget-byte v8, v0, v3

    aput-byte v8, v5, v3

    .line 302
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 309
    :cond_2
    const/4 v8, 0x0

    aput-byte v8, v1, v3

    .line 308
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 313
    :cond_3
    iget-object v8, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/16 v9, 0x8

    aget-object v8, v8, v9

    aget-byte v9, v5, v3

    aput-byte v9, v8, v3

    .line 314
    iget-object v8, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/16 v9, 0x9

    aget-object v8, v8, v9

    aget-byte v9, v1, v3

    aput-byte v9, v8, v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 311
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 326
    .end local v0    # "cellId":[B
    .end local v1    # "down_cellId":[B
    .end local v3    # "i":I
    .end local v5    # "upper_cellId":[B
    :catch_0
    move-exception v4

    .line 327
    .local v4, "nfe":Ljava/lang/NumberFormatException;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v7, v4}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_3

    .line 329
    .end local v4    # "nfe":Ljava/lang/NumberFormatException;
    :catch_1
    move-exception v2

    .line 330
    .local v2, "e":Ljava/lang/Exception;
    goto :goto_3
.end method

.method private setField([BLjava/lang/String;)V
    .locals 4
    .param p1, "target"    # [B
    .param p2, "src"    # Ljava/lang/String;

    .prologue
    .line 344
    if-nez p2, :cond_0

    const-string p2, ""

    .line 346
    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    .line 347
    .local v1, "size":I
    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    .line 348
    .local v2, "srdBuff":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-lt v0, v1, :cond_1

    .line 351
    return-void

    .line 349
    :cond_1
    aget-byte v3, v2, v0

    aput-byte v3, p1, v0

    .line 348
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private setIPPort(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "port"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x1

    const/16 v8, 0x2e

    const/16 v7, 0xc

    const/4 v6, 0x0

    .line 265
    invoke-virtual {p1, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 266
    .local v1, "idx":I
    iget-object v4, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    aget-object v4, v4, v7

    invoke-virtual {p1, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, v4, v6

    .line 267
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 269
    invoke-virtual {p1, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 270
    iget-object v4, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    aget-object v4, v4, v7

    invoke-virtual {p1, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, v4, v9

    .line 271
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 273
    invoke-virtual {p1, v8}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 274
    iget-object v4, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    aget-object v4, v4, v7

    const/4 v5, 0x2

    invoke-virtual {p1, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 275
    add-int/lit8 v4, v1, 0x1

    invoke-virtual {p1, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 277
    iget-object v4, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    aget-object v4, v4, v7

    const/4 v5, 0x3

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 280
    :try_start_0
    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    .line 281
    .local v2, "nPort":I
    iget-object v4, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/16 v5, 0xb

    aget-object v4, v4, v5

    const/4 v5, 0x0

    shr-int/lit8 v6, v2, 0x8

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5

    .line 282
    iget-object v4, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/16 v5, 0xb

    aget-object v4, v4, v5

    const/4 v5, 0x1

    and-int/lit16 v6, v2, 0xff

    int-to-byte v6, v6

    aput-byte v6, v4, v5
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 288
    .end local v2    # "nPort":I
    :goto_0
    return-void

    .line 283
    :catch_0
    move-exception v3

    .line 284
    .local v3, "nfe":Ljava/lang/NumberFormatException;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v4, v3}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_0

    .line 285
    .end local v3    # "nfe":Ljava/lang/NumberFormatException;
    :catch_1
    move-exception v0

    .line 286
    .local v0, "e":Ljava/lang/Exception;
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v4, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method public GetHeader(I)[B
    .locals 8
    .param p1, "datasize"    # I

    .prologue
    const/4 v7, 0x0

    .line 239
    add-int/lit8 v3, p1, 0x6c

    .line 240
    .local v3, "leng_total":I
    const/4 v4, 0x0

    .line 244
    .local v4, "sendLen":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    sget-object v5, Lcom/beyond/io/BillHeader;->sizes:[I

    aget v5, v5, v7

    if-lt v2, v5, :cond_0

    .line 247
    const/16 v5, 0x6c

    new-array v1, v5, [B

    .line 250
    .local v1, "headerBuf":[B
    const/4 v2, 0x0

    :goto_1
    const/16 v5, 0x10

    if-lt v2, v5, :cond_1

    .line 261
    :goto_2
    return-object v1

    .line 245
    .end local v1    # "headerBuf":[B
    :cond_0
    iget-object v5, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    aget-object v5, v5, v7

    rsub-int/lit8 v6, v2, 0x3

    mul-int/lit8 v6, v6, 0x8

    shr-int v6, v3, v6

    and-int/lit16 v6, v6, 0xff

    int-to-byte v6, v6

    aput-byte v6, v5, v2

    .line 244
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 251
    .restart local v1    # "headerBuf":[B
    :cond_1
    :try_start_0
    iget-object v5, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    aget-object v5, v5, v2

    const/4 v6, 0x0

    sget-object v7, Lcom/beyond/io/BillHeader;->sizes:[I

    aget v7, v7, v2

    invoke-static {v5, v6, v1, v4, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 252
    sget-object v5, Lcom/beyond/io/BillHeader;->sizes:[I

    aget v5, v5, v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/2addr v4, v5

    .line 250
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 254
    :catch_0
    move-exception v0

    .line 255
    .local v0, "e":Ljava/lang/Exception;
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "<<GetBillHeader_Exception>>"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 256
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_2
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "port"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x5

    const/4 v10, 0x1

    .line 100
    invoke-direct {p0, p1, p2}, Lcom/beyond/io/BillHeader;->setIPPort(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    sget-boolean v9, Lcom/beyond/io/BillHeader;->PHONE:Z

    if-eqz v9, :cond_a

    .line 105
    :try_start_0
    const-string v9, "app_id"

    invoke-static {v9}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 107
    .local v0, "AppProg":Ljava/lang/String;
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/4 v10, 0x1

    aget-object v9, v9, v10

    invoke-direct {p0, v9, v0}, Lcom/beyond/io/BillHeader;->setField([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 116
    .end local v0    # "AppProg":Ljava/lang/String;
    :goto_0
    :try_start_1
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->apiVersion:Ljava/lang/String;

    if-nez v9, :cond_0

    .line 117
    const-string v9, "WIPISTANDARDVERSION"

    invoke-static {v9}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/beyond/io/BillHeader;->apiVersion:Ljava/lang/String;

    .line 120
    :cond_0
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/4 v10, 0x2

    aget-object v9, v9, v10

    iget-object v10, p0, Lcom/beyond/io/BillHeader;->apiVersion:Ljava/lang/String;

    invoke-direct {p0, v9, v10}, Lcom/beyond/io/BillHeader;->setField([BLjava/lang/String;)V

    .line 122
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->extVersion:Ljava/lang/String;

    if-nez v9, :cond_1

    .line 123
    const-string v9, "EXTENSIONAPIVERSION"

    invoke-static {v9}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/beyond/io/BillHeader;->extVersion:Ljava/lang/String;

    .line 126
    :cond_1
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/4 v10, 0x3

    aget-object v9, v9, v10

    iget-object v10, p0, Lcom/beyond/io/BillHeader;->extVersion:Ljava/lang/String;

    invoke-direct {p0, v9, v10}, Lcom/beyond/io/BillHeader;->setField([BLjava/lang/String;)V

    .line 128
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->model:Ljava/lang/String;

    if-nez v9, :cond_2

    .line 129
    const-string v9, "PHONEMODEL"

    invoke-static {v9}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/beyond/io/BillHeader;->model:Ljava/lang/String;

    .line 132
    :cond_2
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/4 v10, 0x4

    aget-object v9, v9, v10

    iget-object v10, p0, Lcom/beyond/io/BillHeader;->model:Ljava/lang/String;

    invoke-direct {p0, v9, v10}, Lcom/beyond/io/BillHeader;->setField([BLjava/lang/String;)V

    .line 134
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->msin:Ljava/lang/String;

    if-nez v9, :cond_3

    .line 135
    const-string v9, "PHONENUMBER"

    invoke-static {v9}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/beyond/io/BillHeader;->msin:Ljava/lang/String;

    .line 137
    :cond_3
    sget-boolean v9, Lcom/beyond/io/BillHeader;->PHONE:Z

    if-eqz v9, :cond_4

    .line 138
    invoke-direct {p0}, Lcom/beyond/io/BillHeader;->checkPhoneNumber()V

    .line 141
    :cond_4
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/4 v10, 0x5

    aget-object v9, v9, v10

    iget-object v10, p0, Lcom/beyond/io/BillHeader;->msin:Ljava/lang/String;

    invoke-direct {p0, v9, v10}, Lcom/beyond/io/BillHeader;->setField([BLjava/lang/String;)V

    .line 143
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->mnc:Ljava/lang/String;

    if-nez v9, :cond_5

    .line 144
    const-string v9, "MNC"

    invoke-static {v9}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/beyond/io/BillHeader;->mnc:Ljava/lang/String;

    .line 147
    :cond_5
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/16 v10, 0xf

    aget-object v9, v9, v10

    iget-object v10, p0, Lcom/beyond/io/BillHeader;->mnc:Ljava/lang/String;

    invoke-direct {p0, v9, v10}, Lcom/beyond/io/BillHeader;->setField([BLjava/lang/String;)V

    .line 149
    const-string v9, "CURRENTCH"

    invoke-static {v9}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/beyond/io/BillHeader;->currentCh:Ljava/lang/String;

    if-eqz v9, :cond_6

    .line 150
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/4 v10, 0x6

    aget-object v9, v9, v10

    iget-object v10, p0, Lcom/beyond/io/BillHeader;->currentCh:Ljava/lang/String;

    invoke-direct {p0, v9, v10}, Lcom/beyond/io/BillHeader;->setField([BLjava/lang/String;)V

    .line 155
    :cond_6
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->currentCh:Ljava/lang/String;

    const-string v10, "W"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_b

    .line 156
    const-string v9, "SID"

    invoke-static {v9}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/beyond/io/BillHeader;->sid:Ljava/lang/String;

    if-eqz v9, :cond_7

    .line 157
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/4 v10, 0x7

    aget-object v9, v9, v10

    iget-object v10, p0, Lcom/beyond/io/BillHeader;->sid:Ljava/lang/String;

    invoke-direct {p0, v9, v10}, Lcom/beyond/io/BillHeader;->setField([BLjava/lang/String;)V

    .line 161
    :cond_7
    const-string v9, "NID"

    invoke-static {v9}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/beyond/io/BillHeader;->nid:Ljava/lang/String;

    if-eqz v9, :cond_8

    .line 162
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/16 v10, 0x8

    aget-object v9, v9, v10

    iget-object v10, p0, Lcom/beyond/io/BillHeader;->nid:Ljava/lang/String;

    invoke-direct {p0, v9, v10}, Lcom/beyond/io/BillHeader;->setField([BLjava/lang/String;)V

    .line 166
    :cond_8
    const-string v9, "BASEID"

    invoke-static {v9}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/beyond/io/BillHeader;->bid:Ljava/lang/String;

    if-eqz v9, :cond_9

    .line 167
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/16 v10, 0x9

    aget-object v9, v9, v10

    iget-object v10, p0, Lcom/beyond/io/BillHeader;->bid:Ljava/lang/String;

    invoke-direct {p0, v9, v10}, Lcom/beyond/io/BillHeader;->setField([BLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 203
    :cond_9
    new-instance v4, Ljava/util/Date;

    invoke-direct {v4}, Ljava/util/Date;-><init>()V

    .line 204
    .local v4, "d":Ljava/util/Date;
    invoke-virtual {v4}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    .line 206
    .local v2, "curtime":J
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/16 v10, 0xd

    invoke-direct {p0, v2, v3}, Lcom/beyond/io/BillHeader;->longToBytes(J)[B

    move-result-object v11

    aput-object v11, v9, v10

    .line 207
    return-void

    .line 108
    .end local v2    # "curtime":J
    .end local v4    # "d":Ljava/util/Date;
    :catch_0
    move-exception v5

    .line 109
    .local v5, "e":Ljava/lang/Exception;
    new-instance v9, Ljava/io/IOException;

    const-string v10, "bad application name"

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 112
    .end local v5    # "e":Ljava/lang/Exception;
    :cond_a
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    aget-object v9, v9, v10

    const-string v10, "EmulApp"

    invoke-direct {p0, v9, v10}, Lcom/beyond/io/BillHeader;->setField([BLjava/lang/String;)V

    goto/16 :goto_0

    .line 173
    :cond_b
    :try_start_2
    const-string v9, "MCC"

    invoke-static {v9}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    iput-object v9, p0, Lcom/beyond/io/BillHeader;->sid:Ljava/lang/String;

    if-eqz v9, :cond_c

    .line 176
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->sid:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v7

    .line 178
    .local v7, "size":I
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->sid:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    .line 179
    .local v8, "srdBuff":[B
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    if-lt v6, v7, :cond_d

    .line 182
    move v6, v7

    :goto_2
    if-lt v6, v11, :cond_e

    .line 189
    .end local v6    # "i":I
    .end local v7    # "size":I
    .end local v8    # "srdBuff":[B
    :cond_c
    const-string v9, "CELL_ID"

    invoke-static {v9}, Lcom/beyond/BeyondBridge;->getSystemProperty0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .local v1, "cellId":Ljava/lang/String;
    if-eqz v1, :cond_9

    .line 191
    invoke-direct {p0, v1}, Lcom/beyond/io/BillHeader;->parseCellID(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_9

    .line 192
    new-instance v9, Ljava/io/IOException;

    const-string v10, "Billcomm Header exception.."

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 199
    .end local v1    # "cellId":Ljava/lang/String;
    :catch_1
    move-exception v5

    .line 200
    .restart local v5    # "e":Ljava/lang/Exception;
    new-instance v9, Ljava/io/IOException;

    new-instance v10, Ljava/lang/StringBuilder;

    const-string v11, "Billcomm Header exception.."

    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 180
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v6    # "i":I
    .restart local v7    # "size":I
    .restart local v8    # "srdBuff":[B
    :cond_d
    :try_start_3
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/4 v10, 0x7

    aget-object v9, v9, v10

    aget-byte v10, v8, v6

    aput-byte v10, v9, v6

    .line 179
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 183
    :cond_e
    iget-object v9, p0, Lcom/beyond/io/BillHeader;->m_fields:[[B

    const/4 v10, 0x7

    aget-object v9, v9, v10

    const/4 v10, 0x0

    aput-byte v10, v9, v6
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 182
    add-int/lit8 v6, v6, 0x1

    goto :goto_2
.end method
