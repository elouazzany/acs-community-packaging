package org.alfresco.web.ui.common.component.data;

/**
 * @author kevinr
 */
public class GridArrayDataModel implements IGridDataModel
{
   /**
    * Constructor
    * 
    * @param data    Array of Object (beans) row data 
    */
   public GridArrayDataModel(Object[] data)
   {
      this.data = data;
   }
   
   /**
    * Get a row object for the specified row index
    * 
    * @param index      valid row index
    * 
    * @return row object for the specified index
    */
   public Object getRow(int index)
   {
      return this.data[index];
   }
   
   /**
    * Return the number of rows in the data model
    * 
    * @return row count
    */
   public int size()
   {
      return this.data.length;
   }
   
   /**
    * Sort the data set using the specified sort parameters
    * 
    * @param column        Column to sort
    * @param descending    True for descending sort, false for ascending
    * @param mode          Sort mode to use (see IDataContainer constants)
    */
   public void sort(String column, boolean descending, String mode)
   {
   }
   
   private Object[] data = null;
}
