	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08031D54
sub_08031D54: @ 0x08031D54
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r0, _08031DB0 @ =gUnknown_0849B060
	ldr r0, [r0]
	ldrh r0, [r0, #0xa]
	adds r0, #0x64
	strh r0, [r2, #0x22]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r4, [r2, #0x1e]
	movs r3, #0x1e
	ldrsh r1, [r2, r3]
	ldr r3, _08031DB4 @ =gUnknown_08090D14
	cmp r0, r1
	beq _08031D82
	ldr r0, [r3]
	ldr r0, [r0]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08031D82
	adds r0, r4, #1
	strh r0, [r2, #0x1e]
_08031D82:
	movs r0, #0x1e
	ldrsh r5, [r2, r0]
	movs r0, #0x20
	ldrsh r6, [r2, r0]
	ldr r4, _08031DB8 @ =gUnknown_0849B074
	ldr r0, [r3]
	ldr r0, [r0]
	lsrs r0, r0, #3
	movs r1, #3
	bl __umodsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	ldr r3, _08031DBC @ =0x00004054
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_0801BD00
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031DB0: .4byte gUnknown_0849B060
_08031DB4: .4byte gUnknown_08090D14
_08031DB8: .4byte gUnknown_0849B074
_08031DBC: .4byte 0x00004054

