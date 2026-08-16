	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080601C8
sub_080601C8: @ 0x080601C8
	push {lr}
	ldr r0, _080601D8 @ =gUnknown_030046C0
	ldrb r0, [r0, #6]
	movs r1, #1
	bl sub_0804438C
	pop {r0}
	bx r0
	.align 2, 0
_080601D8: .4byte gUnknown_030046C0

