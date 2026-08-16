	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08030D4C
sub_08030D4C: @ 0x08030D4C
	push {lr}
	ldr r0, _08030D74 @ =gUnknown_0849B018
	ldr r1, [r0]
	ldrh r0, [r1, #4]
	movs r0, #5
	strh r0, [r1, #4]
	ldr r0, _08030D78 @ =gUnknown_03003FC0
	adds r0, #0x32
	movs r1, #1
	strb r1, [r0]
	ldr r0, _08030D7C @ =gUnknown_03004008
	bl sub_0802F8FC
	ldr r0, _08030D80 @ =gUnknown_03001FBC
	ldrb r0, [r0]
	bl sub_08015C30
	pop {r0}
	bx r0
	.align 2, 0
_08030D74: .4byte gUnknown_0849B018
_08030D78: .4byte gUnknown_03003FC0
_08030D7C: .4byte gUnknown_03004008
_08030D80: .4byte gUnknown_03001FBC

