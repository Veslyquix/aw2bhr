	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801B018
sub_0801B018: @ 0x0801B018
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r0, _0801B060 @ =gUnknown_0200CC30
	ldrb r0, [r0]
	ldr r1, _0801B064 @ =gUnknown_0200CC34
	ldr r1, [r1]
	bl sub_0801B598
	movs r6, #0
	ldr r7, _0801B068 @ =gUnknown_02002000
	ldr r0, _0801B06C @ =gUnknown_0200CC58
	adds r4, r5, r0
_0801B032:
	adds r0, r5, #0
	movs r1, #0
	adds r2, r7, #0
	movs r3, #0x80
	lsls r3, r3, #5
	bl sub_0801B66C
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_0801B648
	cmp r0, #0
	bne _0801B07C
	bl sub_0801B09C
	cmp r0, #0
	beq _0801B070
	ldrb r1, [r4]
	movs r0, #4
	orrs r0, r1
	strb r0, [r4]
	movs r0, #4
	b _0801B092
	.align 2, 0
_0801B060: .4byte gUnknown_0200CC30
_0801B064: .4byte gUnknown_0200CC34
_0801B068: .4byte gUnknown_02002000
_0801B06C: .4byte gUnknown_0200CC58
_0801B070:
	ldrb r1, [r4]
	movs r0, #0xfa
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	b _0801B092
_0801B07C:
	adds r6, #1
	cmp r6, #3
	ble _0801B032
	ldr r0, _0801B098 @ =gUnknown_0200CC38
	adds r0, #0x20
	adds r0, r5, r0
	ldrb r2, [r0]
	movs r1, #1
	orrs r1, r2
	strb r1, [r0]
	movs r0, #1
_0801B092:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801B098: .4byte gUnknown_0200CC38

