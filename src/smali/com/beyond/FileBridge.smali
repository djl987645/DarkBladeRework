.class public Lcom/beyond/FileBridge;
.super Ljava/lang/Object;
.source "FileBridge.java"


# static fields
.field public static final PRIVATE_ACCESS:I = 0x1

.field private static final PRIVATE_DIR:Ljava/lang/String; = "P"

.field public static final READ_ONLY:I = 0x1

.field public static final READ_WRITE:I = 0x4

.field public static final SHARED_ACCESS:I = 0x2

.field private static final SHARED_DIR:Ljava/lang/String; = "sh"

.field public static final SYSTEM_ACCESS:I = 0x3

.field private static final SYSTEM_DIR:Ljava/lang/String; = "sys"

.field public static final WRITE:I = 0x2

.field public static final WRITE_TRUNC:I = 0x3


# instance fields
.field private f_handle:Ljava/io/RandomAccessFile;

.field protected handle:I

.field protected mode:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;

    .line 26
    iput v1, p0, Lcom/beyond/FileBridge;->mode:I

    .line 28
    iput v1, p0, Lcom/beyond/FileBridge;->handle:I

    .line 8
    return-void
.end method

.method public static available0()I
    .locals 5

    .prologue
    .line 165
    invoke-static {}, Landroid/os/Environment;->getDataDirectory()Ljava/io/File;

    move-result-object v2

    .line 166
    .local v2, "file":Ljava/io/File;
    new-instance v3, Landroid/os/StatFs;

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 167
    .local v3, "fs":Landroid/os/StatFs;
    invoke-virtual {v3}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v0

    .line 168
    .local v0, "bc":I
    invoke-virtual {v3}, Landroid/os/StatFs;->getBlockSize()I

    move-result v1

    .line 169
    .local v1, "bs":I
    mul-int v4, v0, v1

    return v4
.end method

.method public static exists(Ljava/lang/String;I)Z
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "mode"    # I

    .prologue
    .line 140
    invoke-static {p1}, Lcom/beyond/FileBridge;->getAppRootDir(I)Ljava/io/File;

    move-result-object v0

    .line 142
    .local v0, "app_root_dir":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 143
    .local v1, "file":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    return v2
.end method

.method static getAppRootDir(I)Ljava/io/File;
    .locals 3
    .param p0, "mode"    # I

    .prologue
    const/4 v2, 0x0

    .line 71
    sget-object v0, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    .line 73
    .local v0, "context":Landroid/content/Context;
    packed-switch p0, :pswitch_data_0

    .line 81
    const/4 v1, 0x0

    :goto_0
    return-object v1

    .line 75
    :pswitch_0
    const-string v1, "P"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v1

    goto :goto_0

    .line 77
    :pswitch_1
    const-string v1, "sh"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v1

    goto :goto_0

    .line 79
    :pswitch_2
    const-string v1, "sys"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v1

    goto :goto_0

    .line 73
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static getCreationTime(Ljava/lang/String;I)I
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "mode"    # I

    .prologue
    .line 183
    new-instance v0, Ljava/io/File;

    invoke-static {p1}, Lcom/beyond/FileBridge;->getAppRootDir(I)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 185
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v1

    long-to-int v1, v1

    return v1
.end method

.method public static getFileDescriptor(Ljava/lang/String;)Ljava/io/FileDescriptor;
    .locals 1
    .param p0, "fileName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 205
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/beyond/FileBridge;->getFileDescriptor(Ljava/lang/String;I)Ljava/io/FileDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public static getFileDescriptor(Ljava/lang/String;I)Ljava/io/FileDescriptor;
    .locals 1
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "flag"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 209
    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Lcom/beyond/FileBridge;->getFileDescriptor(Ljava/lang/String;II)Ljava/io/FileDescriptor;

    move-result-object v0

    return-object v0
.end method

.method public static getFileDescriptor(Ljava/lang/String;II)Ljava/io/FileDescriptor;
    .locals 5
    .param p0, "fileName"    # Ljava/lang/String;
    .param p1, "mode"    # I
    .param p2, "flag"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .prologue
    .line 213
    invoke-static {p2}, Lcom/beyond/FileBridge;->getAppRootDir(I)Ljava/io/File;

    move-result-object v0

    .line 214
    .local v0, "app_root_dir":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v0, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 216
    .local v2, "file":Ljava/io/File;
    const/4 v3, 0x0

    .line 217
    .local v3, "new_mode":I
    packed-switch p1, :pswitch_data_0

    .line 232
    :goto_0
    invoke-static {v2, v3}, Landroid/os/ParcelFileDescriptor;->open(Ljava/io/File;I)Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    .line 233
    .local v1, "fd":Landroid/os/ParcelFileDescriptor;
    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v4

    return-object v4

    .line 219
    .end local v1    # "fd":Landroid/os/ParcelFileDescriptor;
    :pswitch_0
    const/high16 v3, 0x10000000

    .line 220
    goto :goto_0

    .line 222
    :pswitch_1
    const/high16 v3, 0x20000000

    .line 223
    goto :goto_0

    .line 225
    :pswitch_2
    const/high16 v3, 0x4000000

    .line 226
    goto :goto_0

    .line 228
    :pswitch_3
    const/high16 v3, 0x30000000

    goto :goto_0

    .line 217
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public static getMaxFilename0()I
    .locals 1

    .prologue
    .line 196
    const/16 v0, 0x100

    return v0
.end method

.method public static getMaxSysFilename0()I
    .locals 1

    .prologue
    .line 201
    const/16 v0, 0x100

    return v0
.end method

.method public static isDirectory(Ljava/lang/String;I)Z
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "mode"    # I

    .prologue
    .line 178
    new-instance v0, Ljava/io/File;

    invoke-static {p1}, Lcom/beyond/FileBridge;->getAppRootDir(I)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 179
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    return v1
.end method

.method public static isFile(Ljava/lang/String;I)Z
    .locals 2
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "mode"    # I

    .prologue
    .line 173
    new-instance v0, Ljava/io/File;

    invoke-static {p1}, Lcom/beyond/FileBridge;->getAppRootDir(I)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 174
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    return v1
.end method

.method public static list(Ljava/lang/String;I)[Ljava/lang/String;
    .locals 3
    .param p0, "dirname"    # Ljava/lang/String;
    .param p1, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 125
    new-instance v0, Ljava/io/File;

    invoke-static {p1}, Lcom/beyond/FileBridge;->getAppRootDir(I)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 126
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_0

    .line 127
    new-instance v1, Ljava/io/IOException;

    const-string v2, "not direcotry"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 128
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->list()[Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static makeDirectory(Ljava/lang/String;I)V
    .locals 4
    .param p0, "szFilename"    # Ljava/lang/String;
    .param p1, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {}, Lcom/beyond/FileBridge;->getMaxFilename0()I

    move-result v3

    if-lt v2, v3, :cond_0

    .line 149
    new-instance v2, Ljava/io/IOException;

    const-string v3, "name is too long."

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 150
    :cond_0
    invoke-static {p1}, Lcom/beyond/FileBridge;->getAppRootDir(I)Ljava/io/File;

    move-result-object v0

    .line 151
    .local v0, "app_root_dir":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 152
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v2

    if-nez v2, :cond_1

    .line 153
    new-instance v2, Ljava/io/IOException;

    const-string v3, "fail makeDirectory"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 154
    :cond_1
    return-void
.end method

.method public static remove(Ljava/lang/String;I)V
    .locals 3
    .param p0, "name"    # Ljava/lang/String;
    .param p1, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    new-instance v0, Ljava/io/File;

    invoke-static {p1}, Lcom/beyond/FileBridge;->getAppRootDir(I)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 133
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 134
    new-instance v1, Ljava/io/IOException;

    const-string v2, "can\'t remove direcotry"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 136
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 137
    return-void
.end method

.method public static removeDirectory(Ljava/lang/String;I)V
    .locals 4
    .param p0, "szFilename"    # Ljava/lang/String;
    .param p1, "mode"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 157
    invoke-static {p1}, Lcom/beyond/FileBridge;->getAppRootDir(I)Ljava/io/File;

    move-result-object v0

    .line 158
    .local v0, "app_root_dir":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 159
    .local v1, "dir":Ljava/io/File;
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    move-result v2

    if-nez v2, :cond_0

    .line 160
    new-instance v2, Ljava/io/IOException;

    const-string v3, "fail to remove"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 161
    :cond_0
    return-void
.end method

.method public static rename(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 3
    .param p0, "oldName"    # Ljava/lang/String;
    .param p1, "newName"    # Ljava/lang/String;
    .param p2, "mode"    # I

    .prologue
    .line 191
    new-instance v0, Ljava/io/File;

    invoke-static {p2}, Lcom/beyond/FileBridge;->getAppRootDir(I)Ljava/io/File;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 192
    .local v0, "file":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    invoke-static {p2}, Lcom/beyond/FileBridge;->getAppRootDir(I)Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 193
    return-void
.end method

.method public static totalSpace()I
    .locals 4

    .prologue
    .line 237
    new-instance v2, Landroid/os/StatFs;

    const-string v3, "."

    invoke-direct {v2, v3}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 238
    .local v2, "fs":Landroid/os/StatFs;
    invoke-virtual {v2}, Landroid/os/StatFs;->getBlockCount()I

    move-result v0

    .line 239
    .local v0, "bc":I
    invoke-virtual {v2}, Landroid/os/StatFs;->getBlockSize()I

    move-result v1

    .line 240
    .local v1, "bs":I
    mul-int v3, v0, v1

    return v3
.end method


# virtual methods
.method protected declared-synchronized close0()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 112
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    .line 118
    :goto_0
    monitor-exit p0

    return-void

    .line 115
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 117
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 112
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected getHandle()Ljava/io/RandomAccessFile;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;

    return-object v0
.end method

.method protected open0(Ljava/lang/String;II)V
    .locals 2
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "mode"    # I
    .param p3, "flag"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 39
    packed-switch p2, :pswitch_data_0

    .line 54
    :goto_0
    iput p2, p0, Lcom/beyond/FileBridge;->mode:I

    .line 55
    return-void

    .line 41
    :pswitch_0
    const-string v0, "r"

    invoke-virtual {p0, p1, v0, p3}, Lcom/beyond/FileBridge;->openFile(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    .line 44
    :pswitch_1
    const-string v0, "rw"

    invoke-virtual {p0, p1, v0, p3}, Lcom/beyond/FileBridge;->openFile(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    .line 47
    :pswitch_2
    const-string v0, "rw"

    invoke-virtual {p0, p1, v0, p3}, Lcom/beyond/FileBridge;->openFile(Ljava/lang/String;Ljava/lang/String;I)V

    .line 48
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/beyond/FileBridge;->setLength(J)V

    goto :goto_0

    .line 51
    :pswitch_3
    const-string v0, "rw"

    invoke-virtual {p0, p1, v0, p3}, Lcom/beyond/FileBridge;->openFile(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    .line 39
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method protected openFile(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 3
    .param p1, "filename"    # Ljava/lang/String;
    .param p2, "mode"    # Ljava/lang/String;
    .param p3, "flag"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 59
    invoke-static {p3}, Lcom/beyond/FileBridge;->getAppRootDir(I)Ljava/io/File;

    move-result-object v0

    .line 60
    .local v0, "app_root_dir":Ljava/io/File;
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0, p1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 62
    .local v1, "j_file":Ljava/io/File;
    new-instance v2, Ljava/io/RandomAccessFile;

    invoke-direct {v2, v1, p2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v2, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;

    .line 63
    return-void
.end method

.method protected read0(I[BII)I
    .locals 1
    .param p1, "handle"    # I
    .param p2, "buf"    # [B
    .param p3, "off"    # I
    .param p4, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 85
    iget-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p2, p3, p4}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v0

    return v0
.end method

.method protected seek0(II)V
    .locals 3
    .param p1, "handle"    # I
    .param p2, "pos"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 94
    iget-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_0

    .line 95
    new-instance v0, Ljava/io/IOException;

    const-string v1, "file not opened "

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_0
    iget-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;

    int-to-long v1, p2

    invoke-virtual {v0, v1, v2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 97
    return-void
.end method

.method public setLength(J)V
    .locals 1
    .param p1, "newLength"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2}, Ljava/io/RandomAccessFile;->setLength(J)V

    .line 67
    return-void
.end method

.method protected sizeOf0(I)I
    .locals 2
    .param p1, "handle"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    iget-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_0

    .line 101
    new-instance v0, Ljava/io/IOException;

    const-string v1, "file not opened "

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method protected tell0(I)I
    .locals 2
    .param p1, "handle"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    iget-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;

    if-nez v0, :cond_0

    .line 107
    new-instance v0, Ljava/io/IOException;

    const-string v1, "file not opened "

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_0
    iget-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFilePointer()J

    move-result-wide v0

    long-to-int v0, v0

    return v0
.end method

.method protected write0(I[BII)I
    .locals 1
    .param p1, "handle"    # I
    .param p2, "buf"    # [B
    .param p3, "off"    # I
    .param p4, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 89
    iget-object v0, p0, Lcom/beyond/FileBridge;->f_handle:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p2, p3, p4}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 90
    return p4
.end method
