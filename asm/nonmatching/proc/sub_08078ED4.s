	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08078ED4
sub_08078ED4: @ 0x08078ED4
	push {lr}
	adds r1, r0, #0
	ldr r0, _08078EE8 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #3
	bne _08078EF0
	ldr r0, _08078EEC @ =gUnknown_08615DD8
	bl Proc_Start
	b _08078EF6
	.align 2, 0
_08078EE8: .4byte gUnknown_03003FC0
_08078EEC: .4byte gUnknown_08615DD8
_08078EF0:
	ldr r0, _08078EFC @ =gUnknown_08615D88
	bl Proc_Start
_08078EF6:
	pop {r0}
	bx r0
	.align 2, 0
_08078EFC: .4byte gUnknown_08615D88

