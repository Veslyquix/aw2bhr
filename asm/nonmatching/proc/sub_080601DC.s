	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080601DC
sub_080601DC: @ 0x080601DC
	push {lr}
	ldr r0, _080601EC @ =gUnknown_030046C0
	ldrb r0, [r0, #6]
	movs r1, #2
	bl sub_0804438C
	pop {r0}
	bx r0
	.align 2, 0
_080601EC: .4byte gUnknown_030046C0

