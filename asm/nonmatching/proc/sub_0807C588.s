	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0807C588
sub_0807C588: @ 0x0807C588
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl sub_08026BAC
	movs r4, #0
	ldr r6, _0807C598 @ =gUnknown_081D9338
	b _0807C5E0
	.align 2, 0
_0807C598: .4byte gUnknown_081D9338
_0807C59C:
	ldr r1, _0807C5C4 @ =gUnknown_085C77A0
	ldrb r2, [r5, #2]
	movs r0, #0x5c
	muls r0, r2, r0
	adds r0, r4, r0
	adds r1, #0x3c
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807C5CC
	ldr r0, _0807C5C8 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x57
	movs r1, #1
	b _0807C5DC
	.align 2, 0
_0807C5C4: .4byte gUnknown_085C77A0
_0807C5C8: .4byte gUnknown_08499598
_0807C5CC:
	ldr r0, _0807C60C @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r1
	adds r0, #0x57
	movs r1, #2
_0807C5DC:
	strb r1, [r0]
	adds r4, #1
_0807C5E0:
	ldr r5, [r6]
	ldrb r0, [r5, #2]
	bl sub_0802490C
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _0807C59C
	movs r0, #0
	str r0, [r7, #0x58]
	str r0, [r7, #0x5c]
	ldr r1, _0807C610 @ =gUnknown_03005910
	movs r2, #0
	adds r0, r1, #4
_0807C5FC:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0807C5FC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C60C: .4byte gUnknown_08499598
_0807C610: .4byte gUnknown_03005910

