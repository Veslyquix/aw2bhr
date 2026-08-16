	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08041258
sub_08041258: @ 0x08041258
	push {lr}
	adds r3, r1, #0
	ldr r1, _08041280 @ =gUnknown_08499598
	ldr r2, [r1]
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldrb r0, [r1, #0x1b]
	cmp r0, #1
	bne _08041290
	movs r0, #0x1f
	ands r0, r3
	cmp r0, #8
	bne _08041284
	movs r0, #0x83
	bl sub_0803B4DC
	b _08041298
	.align 2, 0
_08041280: .4byte gUnknown_08499598
_08041284:
	ldr r0, _0804128C @ =0x000001D9
	bl sub_0803B4DC
	b _08041298
	.align 2, 0
_0804128C: .4byte 0x000001D9
_08041290:
	movs r0, #0xed
	lsls r0, r0, #1
	bl sub_0803B4DC
_08041298:
	pop {r0}
	bx r0

