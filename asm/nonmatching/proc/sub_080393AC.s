	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080393AC
sub_080393AC: @ 0x080393AC
	push {r4, lr}
	ldr r4, _080393C8 @ =gUnknown_03001FBC
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08016824
	movs r1, #0
	ldrsh r0, [r4, r1]
	bl sub_08016944
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080393C8: .4byte gUnknown_03001FBC

