	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08035144
sub_08035144: @ 0x08035144
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl sub_080350E4
	ldr r1, _08035168 @ =gUnknown_03004490
	movs r0, #0x32
	strb r0, [r1]
	ldr r0, _0803516C @ =gUnknown_0849BD38
	movs r1, #0
	bl sub_080152EC
	strh r4, [r0, #0x20]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08035168: .4byte gUnknown_03004490
_0803516C: .4byte gUnknown_0849BD38

