	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08074AAC
sub_08074AAC: @ 0x08074AAC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08074AC8 @ =gUnknown_0202FDFC
	movs r4, #0
	strb r4, [r0, #0x10]
	ldr r0, _08074ACC @ =gUnknown_086142E4
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r4, [r0, #0x30]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08074AC8: .4byte gUnknown_0202FDFC
_08074ACC: .4byte gUnknown_086142E4

