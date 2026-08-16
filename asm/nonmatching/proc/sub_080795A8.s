	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080795A8
sub_080795A8: @ 0x080795A8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r1, #0
	movs r7, #0xa0
	lsls r7, r7, #1
	movs r6, #8
	rsbs r6, r6, #0
	movs r0, #0x14
	mov r8, r0
	movs r5, #3
_080795C0:
	cmp r4, #0x54
	bhi _080795DC
	ldr r1, _08079608 @ =0x000001FF
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #7
	orrs r0, r7
	str r0, [sp]
	movs r0, #0
	mov r3, r8
	subs r2, r3, r4
	ldr r3, _0807960C @ =gUnknown_0848B6A0
	bl PutSprite
_080795DC:
	adds r7, #0x40
	adds r6, #0x40
	subs r5, #1
	cmp r5, #0
	bge _080795C0
	cmp r4, #0x1c
	bhi _080795FC
	movs r2, #0xc
	subs r2, r2, r4
	ldr r3, _08079610 @ =gUnknown_08615BE4
	ldr r0, _08079614 @ =0x000052D8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x32
	bl PutSprite
_080795FC:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08079608: .4byte 0x000001FF
_0807960C: .4byte gUnknown_0848B6A0
_08079610: .4byte gUnknown_08615BE4
_08079614: .4byte 0x000052D8

