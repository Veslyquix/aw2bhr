	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08077118
sub_08077118: @ 0x08077118
	push {lr}
	ldr r0, _08077138 @ =gUnknown_0202FDFC
	movs r1, #0
	strb r1, [r0, #0x10]
	bl sub_0801C1F8
	bl sub_08074744
	ldr r0, _0807713C @ =gUnknown_086143E0
	bl Proc_EndEach
	bl sub_080755E0
	pop {r0}
	bx r0
	.align 2, 0
_08077138: .4byte gUnknown_0202FDFC
_0807713C: .4byte gUnknown_086143E0

