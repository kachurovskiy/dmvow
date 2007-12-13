package ru.dmvow.model.pmml.models.associationModel
{
	import ru.dmvow.model.pmml.common.Extendable;
	
	/**
	 * <p>
	 * <code>
	 * <xs:element name="Itemset">
	 *     <xs:complexType>
	 *         <xs:sequence>
	 *             <xs:element ref="Extension" minOccurs="0" maxOccurs="unbounded"/>
	 *             <xs:element minOccurs="0" maxOccurs="unbounded" ref="ItemRef" />
	 *         </xs:sequence>
	 *         <xs:attribute name="id" type="xs:string" use="required" />
	 *         <xs:attribute name="support" type="PROB-NUMBER" />
	 *         <xs:attribute name="numberOfItems" type="xs:nonNegativeInteger" />
	 *     </xs:complexType>
	 * </xs:element>
	 * </code>
	 * </p>
	 */
	public class Itemset extends Extendable
	{
		/**
		 * Array of ItemRef objects. Can be empty.
		 */
		public var itemRefs:Array = new Array();
		/**
		 * Required.
		 */
		public var id:String;
		/**
		 * Optional.
		 */
		public var support:Number;
		/**
		 * Optional.
		 */
		public var numberOfItems:uint;
	}
}