	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080531D4
sub_080531D4: @ 0x080531D4
	push {r4, r5, lr}
	bl sub_08036C08
	bl sub_080546F0
	ldr r4, _0805324C @ =gUnknown_03004504
	ldrb r0, [r4]
	movs r5, #1
	adds r1, r5, #0
	ands r1, r0
	cmp r1, #0
	bne _080531F0
	ldr r0, _08053250 @ =gUnknown_030030CC
	strh r1, [r0]
_080531F0:
	bl sub_08012420
	bl sub_080553C8
	bl sub_08054C04
	ldr r0, _08053254 @ =gUnknown_08553820
	movs r1, #0
	bl sub_080152C0
	ldr r0, _08053258 @ =gUnknown_0300453C
	movs r1, #0
	strh r1, [r0]
	ldr r0, _0805325C @ =gUnknown_0300451C
	strh r1, [r0]
	bl sub_08057270
	bl sub_0804BA4C
	ldrb r1, [r4]
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08053240
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08053240
	ldr r3, _08053260 @ =gUnknown_03004508
	ldr r2, _08053264 @ =gUnknown_085537EC
	ldr r1, _08053268 @ =gUnknown_030045A0
	ldr r0, _0805326C @ =gUnknown_0300450C
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r0, [r0]
	strh r0, [r3]
_08053240:
	bl sub_08012420
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805324C: .4byte gUnknown_03004504
_08053250: .4byte gUnknown_030030CC
_08053254: .4byte gUnknown_08553820
_08053258: .4byte gUnknown_0300453C
_0805325C: .4byte gUnknown_0300451C
_08053260: .4byte gUnknown_03004508
_08053264: .4byte gUnknown_085537EC
_08053268: .4byte gUnknown_030045A0
_0805326C: .4byte gUnknown_0300450C

