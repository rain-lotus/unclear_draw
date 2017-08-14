import java.awt.datatransfer.DataFlavor;  
import java.awt.datatransfer.Transferable;  
import java.awt.datatransfer.UnsupportedFlavorException;  
import java.awt.dnd.DnDConstants;  
import java.awt.dnd.DropTarget;  
import java.awt.dnd.DropTargetDragEvent;  
import java.awt.dnd.DropTargetDropEvent;  
import java.awt.dnd.DropTargetEvent;  
import java.awt.dnd.DropTargetListener;  
import java.io.File;  
import java.io.IOException;  
import java.awt.Component;
import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;

DropTarget dropTarget;  
Component component;

class FileOperation {
  File targetFile = null;
  String path = "";

  void setTargetFile(String Path) {
    targetFile = new File(Path);
    path = Path;
  }

  String lastModifiedTime() {
    //最終更新日時表示書式
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy / MM / dd HH:mm:ss");
    //対象ファイルの最終更新日時取得（1970年1月1日からの経過時間）
    Long lastModified = this.targetFile.lastModified();
    //最終更新日時書式整形
    String lastModifiedStr = sdf.format(lastModified);
    //表示
    return lastModifiedStr;
  }

  String fileName() {
    //対象ファイルの名前取得
    String name = this.targetFile.getName();
    //表示
    return name;
  }
}

void dragDropFile() {
  component = (Component)this.surface.getNative();
  // ==================================================  
  // ファイルのドラッグ&ドロップをサポートするコード  
  // ==================================================  
  dropTarget = new DropTarget(component, new DropTargetListener() {  
    public void dragEnter(DropTargetDragEvent dtde) {
    }  
    public void dragOver(DropTargetDragEvent dtde) {
    }  
    public void dropActionChanged(DropTargetDragEvent dtde) {
    }  
    public void dragExit(DropTargetEvent dte) {
    }  
    public void drop(DropTargetDropEvent dtde) {  
      dtde.acceptDrop(DnDConstants.ACTION_COPY_OR_MOVE);  
      Transferable trans = dtde.getTransferable();  
      List<File> fileNameList = null;  
      if (trans.isDataFlavorSupported(DataFlavor.javaFileListFlavor)) {  
        try {  
          fileNameList = (List<File>)  
            trans.getTransferData(DataFlavor.javaFileListFlavor);
        } 
        catch (UnsupportedFlavorException ex) {  
          println(ex);
        } 
        catch (IOException ex) {  
          println(ex);
        }
      }  
      if (fileNameList == null) return;  
      // ドラッグ&ドロップされたファイルの一覧は一時リストに格納される  
      // 以下のように書くと、ファイルのフルパスを表示  
      for (File f : fileNameList) {
        println(f.getAbsolutePath());
      }
    }
  }
  );
}