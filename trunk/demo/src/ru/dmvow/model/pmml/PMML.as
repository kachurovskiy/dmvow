package ru.dmvow.model.pmml
{
	import mx.collections.ArrayCollection;
	
	import ru.dmvow.model.pmml.dataDictionary.DataDictionary;
	import ru.dmvow.model.pmml.header.Header;
	import ru.dmvow.model.pmml.miningBuildTask.MiningBuildTask;
	import ru.dmvow.model.pmml.transformationDictionary.TransformationDictionary;
	
	/**
	 * <p>
	 * <code>
	 * <xs:element name="PMML">
	 *     <xs:complexType>
	 *         <xs:sequence>
	 *             <xs:element ref="Header"/>
	 *             <xs:element ref="MiningBuildTask" minOccurs="0"/>
	 *             <xs:element ref="DataDictionary"/>
	 *             <xs:element ref="TransformationDictionary" minOccurs="0"/>
	 *             <xs:sequence minOccurs="0" maxOccurs="unbounded">
	 *                 <xs:choice>
	 *                     <xs:element ref="AssociationModel"/>
	 *                     <xs:element ref="ClusteringModel"/>
	 *                     <xs:element ref="GeneralRegressionModel"/>
	 *                     <xs:element ref="MiningModel"/>
	 *                     <xs:element ref="NaiveBayesModel"/>
	 *                     <xs:element ref="NeuralNetwork"/>
	 *                     <xs:element ref="RegressionModel"/>
	 *                     <xs:element ref="RuleSetModel"/>
	 *                     <xs:element ref="SequenceModel"/>
	 *                     <xs:element ref="SupportVectorMachineModel"/>
	 *                     <xs:element ref="TextModel"/>
	 *                     <xs:element ref="TreeModel"/>
	 *                 </xs:choice>
	 *             </xs:sequence>
	 *             <xs:element ref="Extension" minOccurs="0" maxOccurs="unbounded"/>
	 *         </xs:sequence>
	 *         <xs:attribute name="version" type="xs:string" use="required"/>
	 *     </xs:complexType>
	 * </xs:element>
	 * </code>
	 * </p>
	 * 
	 * <p>Example of the XML:</p>
	 * 
	 * <p>
	 * <code>
	 * <?xml version="1.0" ?>
	 * <PMML version="3.2" xmlns="http://www.dmg.org/PMML-3_2" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	 *     <Header copyright="www.dmg.org" description="example model for association rules"/>
	 *     <DataDictionary numberOfFields="2" >
	 *         <DataField name="transaction" optype="categorical" dataType="string" />
	 *         <DataField name="item" optype="categorical" dataType="string" />
	 *     </DataDictionary>
	 *     <!-- models -->
	 * </PMML>
	 * </code>
	 * </p>
	 */
	public class PMML
	{
		/** Required. */
		public var version:String;
		/** Required. */
		public var header:Header;
		/** Optional. */
		public var miningBuildTask:MiningBuildTask;
		/** Required. */
		public var dataDictionary:DataDictionary;
		/** Optional. */
		public var transformationDictionary:TransformationDictionary;
		/**
		 * Array of MiningModel objects - models. Can be empty.
		 */
		public var models:Array = new Array();
	}
}