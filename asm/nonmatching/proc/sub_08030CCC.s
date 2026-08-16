	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030CCC
sub_08030CCC: @ 0x08030CCC
	push {lr}
	bl sub_08030D1C
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	cmp r3, #1
	bne _08030D08
	ldr r2, _08030D0C @ =gUnknown_0849B018
	ldr r1, [r2]
	ldrb r0, [r1, #0x1e]
	movs r0, #0
	strb r0, [r1, #0x1e]
	ldr r1, [r2]
	ldrh r0, [r1, #4]
	movs r0, #4
	strh r0, [r1, #4]
	ldrh r0, [r1, #4]
	movs r0, #5
	strh r0, [r1, #4]
	ldr r0, _08030D10 @ =gUnknown_03003FC0
	adds r0, #0x32
	strb r3, [r0]
	ldr r0, _08030D14 @ =gUnknown_03004008
	movs r1, #1
	bl sub_0802F8FC
	ldr r0, _08030D18 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
_08030D08:
	pop {r0}
	bx r0
	.align 2, 0
_08030D0C: .4byte gUnknown_0849B018
_08030D10: .4byte gUnknown_03003FC0
_08030D14: .4byte gUnknown_03004008
_08030D18: .4byte gUnknown_03001FBC

